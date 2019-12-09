#!/usr/bin/env bash

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

