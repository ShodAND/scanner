#!/bin/bash

PATHH=`dirname $0`
. $PATHH/settings.sh

tag="latest"
if [ "$#" -ge 1 ]; then
    tag="$1"
fi


# Prepare sockets and logs path
mkdir -p $socket_path

# Make a preventive deletion of the container
docker rm -f $SHODAND_SCANNER_container 2&> /dev/null

# Start the container
#container_id=`docker run --restart=always --network=host $SHODAND_SCANNER_logs --name $SHODAND_SCANNER_container -i $SHODAND_SCANNER_image:$tag`
echo docker run --network=host --cap-add=NET_ADMIN --name $SHODAND_SCANNER_container $SHODAND_SCANNER_image:$tag
docker run --network=host --cap-add=NET_ADMIN --name $SHODAND_SCANNER_container -it $SHODAND_SCANNER_image:$tag
