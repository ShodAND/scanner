#!/bin/bash

PATHH=`dirname $0`
. $PATHH/settings.sh

tag="latest"
if [ "$#" -ge 1 ]; then
    tag="$1"
fi


# Prepare sockets and logs path
#mkdir -p $socket_path
#mkdir -p $SHODAND_SCANNER_logs_destination

# Make a preventive deletion of the container
docker rm -f $SHODAND_SCANNER_container 2&> /dev/null

# Start the container
#container_id=`docker run --restart=always --network=host $SHODAND_SCANNER_logs --name $SHODAND_SCANNER_container -i $SHODAND_SCANNER_image:$tag`
echo docker run --network=host --cap-add=NET_ADMIN --name $SHODAND_SCANNER_container -i $SHODAND_SCANNER_image:$tag
container_id=`docker run --network=host --cap-add=NET_ADMIN --name $SHODAND_SCANNER_container -i $SHODAND_SCANNER_image:$tag`

if [ "$container_id" != "" ]
then
    chmod -R 777 $socket_path
    echo "$container_id" > $SHODAND_SCANNER_pid
    echo "$SHODAND_SCANNER_container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm $SHODAND_SCANNER_pid
    fi
    echo "[Error] $SHODAND_SCANNER_container can't be started!"
fi

