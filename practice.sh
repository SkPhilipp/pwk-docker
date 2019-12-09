#!/usr/bin/env bash

if [ -z "$1" ]
then
    echo "Usage:"
    echo "  practice start"
    echo "  practice stop"
    exit 1
fi

if [ "$1" == "start" ]
then
    containerId=$(docker ps | grep practice | cut -d " " -f 1 | head -n 1)
    if [ -z "$containerId" ]
    then
        docker build . -t practice
        echo "# run:"
        echo "# ./checkout.sh"
        echo "# cd pwk"
        echo "# ./network.sh &"
        docker run -it --cap-add=NET_ADMIN --privileged --device=/dev/net/tun --hostname practice practice
    else
        echo "exec into $containerId"
        docker exec -it $containerId bash
    fi
fi

if [ "$1" == "stop" ]
then
    containerIds=$(docker ps -a -q)
    if [ -z "$containerIds" ]
    then
        docker stop $containerIds
        docker rm $containerIds
    fi
fi
