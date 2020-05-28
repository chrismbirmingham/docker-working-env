#!/bin/bash

docker build --rm -f dockerfiles/ros-kinetic_harmoni --tag harmoni/ros-kinetic_harmoni:latest --squash .
docker build --rm -f dockerfiles/ros-kinetic_harmoni_harmoni-pc --tag harmoni/ros-kinetic_harmoni_harmoni-pc:latest --squash .
docker build --rm -f dockerfiles/ros-kinetic_harmoni-pc --tag harmoni/ros-kinetic_harmoni-pc:latest --squash .
docker build --rm -f dockerfiles/ros-kinetic_harmoni_w2l-inf --tag harmoni/ros-kinetic_harmoni_w2l-inf:latest --squash .

xhost +local:
docker-compose -f docker-compose-harmoni.yml up --remove-orphans
docker build --rm -f dockerfiles/ssh-test --tag ssh-test:latest --squash .
