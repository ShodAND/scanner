FROM ubuntu:16.04

MAINTAINER Xavi Torelló <info@gnuites.cat>

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

ARG SHODAND_SCANNER_PATH=/opt/pbscan
ARG SHODAND_SCANNER_VERSION=master

RUN # "========= Installing shodAND! Scanner ========="

# Install base deps
RUN apt-get update && apt-get install -y --no-install-recommends\
    ssh \
    git \
    vim \
    ca-certificates \
    iputils-ping \
    iptables 

# Fetch github footprint
RUN mkdir -p ~/.ssh && mkdir -p /opt
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

# Clone repository
RUN # Preparing PBscan $SHODAND_SCANNER_VERSION
RUN git clone https://github.com/gvb84/pbscan.git/ $SHODAND_SCANNER_PATH

# Install pbscan requirements
RUN ls -lah $SHODAND_SCANNER_PATH
RUN apt-get install -y --no-install-recommends $(cat $SHODAND_SCANNER_PATH/DEPENDENCIES)

# Make pbscan
RUN cd $SHODAND_SCANNER_PATH && make

# Symlink bpscan to local bin path
RUN ln -s /opt/pbscan/pbscan /usr/local/bin/

# Run the scanner
#CMD /opt/
