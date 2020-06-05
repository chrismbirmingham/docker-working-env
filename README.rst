======
README
======

I do a lot of work with ROS (Robot Operating System). 
Setting up ROS installs many things and modifies your system's paths.
Occasionally this makes it difficult to use other software.
It also adds many packages to the systems default Python interpreter, making it difficult to understand what your projects actually depend on.
It would be nice to keep ROS separate from your main computer system. 

Enter Docker.

Docker lets you create containers (effectively, light-weight virtual machines) to run ROS and do your development.
It also can talk to your machine's network, so it can be used on your robots with their ROS network.

Ever try getting your code to run on another computer afte you've been hacking for a while?
A **huge** benefit to doing things this way is that your setup is repeatable.
You modify the Dockerfile so that you can run your code and then just ship the Dockerfile, which sets up your environment.

Oh, and you can develop on a different operating system.
Say, you need to develop on Ubuntu 14.04 for your ROS project, but 18.04 is much nicer to use day to day.


********
Features
********

Visual
    Open up your favorite IDE, photos, videos, file explorer, Rviz, etc. from within a Docker container

Volumes
    Save your work between sessions in volumes; also share files back and forth with your container in the shared folder

Less risk in testing software
    Explore solutions to your problems with abandon; if you break the Docker container, just spawn another Docker container - no more reinstalling your operating system

ROS code completion
    Open PyCharm and you'll be able to use code completion with `rospy` 

**************
How this works
**************

There is a Dockerfile that sets up ROS (currently setup for Kinetic on 16.04) and installs several things that I want to use, including the PyCharm IDE.
The Dockerfile is called by Docker compose file (`docker-compose.yaml`) that builds the Dockerfile and sets it up.
Setting it up includes setting it up with your system network, giving your container access to your display (only tested on Ubuntu systems) and sound, and creating persistent data volumes.
These persistent data volumes allow you to close and destroy your spawned Docker container and then to access the same data in a newly created one. 
This is all kicked off with a run script (`run.sh`) that runs the docker compose file after setting up your xhost to allow local connections (so you can open windows).

For convience, this opens a new terminal (terminator, actually) so that you can work in your new environment opening new tabs, etc.
Oh, and you can open IDE's, too.
Both PyCharm, Atom, and Visual Studio Code are installed in the Dockerfile.


*****
Setup
*****

Install Docker and Docker-compose.

Ubuntu
======

Setup Docker
------------

1. Install Docker::

    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh

2. Set Docker to run without :code:`sudo`::

    sudo groupadd docker
    sudo gpasswd -a $USER docker
    newgrp docker

3. Test that Docker is installed correctly and works without :code:`sudo`::

    docker run hello-world

Setup Docker-compose
--------------------

1. Install Docker-compose::

    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

2. Check that docker compose is installed correctly::

    docker-compose version

Run it
------

::

    ./run.sh

Build it
--------
docker build --rm -f path/to/dockerfile --tag dockerhub_username/containername:latest --squash .
