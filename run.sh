#!/bin/bash

# share display on ubuntu platforms
xhost +local:

# build the docker container and run the default command 
# set in the Dockerfile or docker-compose.yaml file
ROS_MASTER_URI=$ROS_MASTER_URI docker-compose up --build
