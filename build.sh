#!/bin/bash

PATHH=`dirname $0`

if [[ $# -gt 0 ]]
then
  docker build -t shodand/scanner:$1 --build-arg ORAKWLUM_FRONTEND_VERSION=$1 $PATHH
else
  docker build -t shodand/scanner:latest $PATHH
fi
