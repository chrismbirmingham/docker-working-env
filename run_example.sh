#!/bin/bash

# Share display on ubuntu platforms
xhost +local:


# FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# cd $FILE_DIR

# Optional methods for passing in args to docker compose
if [ -z ${1+x} ]; 
then 
	WORKSPACE="path/to/project_dir";
else
	WORKSPACE=$1;
fi

# If you would like to run just a single dockerfile
DOCKERFILE="folder/Dockerfile"

# Set up docker container to run as user (so it doesn't create root files in the home dir)
CURRENT_UID=$(id -u):$(id -g)

PROJECT=$WORKSPACE DOCKERFILE=$DOCKERFILE CURRENT_UID=$CURRENT_UID docker-compose -f docker-compose.yml up