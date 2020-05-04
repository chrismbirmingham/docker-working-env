#!/bin/bash

docker build --rm -f dockerfiles/dev/ubuntu16-dev --tag cmbirmingham/ubuntu16-dev:latest --squash .
docker build --rm -f dockerfiles/dev/ros-kinetic-dev --tag cmbirmingham/ros-kinetic-dev:latest --squash .
docker build --rm -f dockerfiles/dev/harmoni-dev --tag cmbirmingham/harmoni-dev:latest --squash .
docker build --rm -f dockerfiles/dev/w2l-dev --tag cmbirmingham/w2l-dev:latest --squash .

