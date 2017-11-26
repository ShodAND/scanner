#!/bin/sh

for process in "receiver" "processor" "transmitter"; do
    echo "Starting $process in background"
    nohup sh -c /opt/commander/$process.py &
done

