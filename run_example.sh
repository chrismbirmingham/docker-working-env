#!/bin/bash

# Share display on ubuntu platforms
xhost +local:


# FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# cd $FILE_DIR

# Optional methods for passing in args to docker compose
if [ -z ${1+x} ]; 
then 
	WORKSPACE="path/to/projectdir";
else
	WORKSPACE=$1;
fi

DOCKERFILE="folder/Dockerfile"

CURRENT_UID=$(id -u):$(id -g)

PROJECT=$WORKSPACE DOCKERFILE=$DOCKERFILE CURRENT_UID=$CURRENT_UID docker-compose -f docker-compose.yml up