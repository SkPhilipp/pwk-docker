#!/usr/bin/env bash

containerIds=$(docker ps -a -q)
docker stop $containerIds
docker rm $containerIds

