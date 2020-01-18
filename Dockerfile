From osrf/ros:kinetic-desktop-full

# Install essentials
RUN \
	apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y \
		software-properties-common \
		apt-utils \
	&& apt-get update -y \
	&& apt-get install -y \
		curl \
		wget \
		tmux \
		tmux \
		zsh \
		curl \
		wget \
		vim \
		emacs24 \
		sudo \
		libgl1-mesa-glx \
		libgl1-mesa-dri \
		mesa-utils \
		unzip \
		terminator \
		git-gui \
		fonts-powerline \
		meld \
	&& rm -rf /var/lib/apt/lists/* 

# Setup new ROS key + install ros packages
RUN \
	apt-key del 421C365BD9FF1F717815A3895523BAEEB01FA116 \
	&& apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
	&& apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y \
		ros-$ROS_DISTRO-ros-control \ 
		ros-$ROS_DISTRO-ros-controllers \ 
		ros-$ROS_DISTRO-gazebo-ros-pkgs \
		ros-$ROS_DISTRO-gazebo-ros-control \
		ros-$ROS_DISTRO-rosbridge-server \
		ros-$ROS_DISTRO-audio-common \
	&& rm -rf /var/lib/apt/lists/* 

# Setup Python3.6 with pip, virtualenv, and ROS
RUN \
	add-apt-repository -y ppa:deadsnakes/ppa \
	&& apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y \
		wget \
		python3.6-dev \
		python3-pip \
		python3-yaml \
		python3-virtualenv \
	&& python3.6 -m pip install --upgrade pip \
	&& python3.6 -m pip install rospkg catkin_pkg catkin_tools \
	&& python3.6 -m pip install awscli \
	&& python3.6 -m pip install --ignore-installed pyyaml \
	&& rm -rf /var/lib/apt/lists/* 

# Setup HTTP server
RUN \
	apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y \
		nodejs \
		npm \
	&& npm install http-server -g \
	&& ln -s /usr/bin/nodejs /usr/bin/node \
	&& rm -rf /var/lib/apt/lists/* 

# Setup Python2 for cordial
RUN \
	apt-get update -y && apt-get upgrade -y \
	&& apt-get install -y \
	    alsa \
	&& apt-get install -y \
		python \
		python-pip \
		python-pygame \
		python-requests \
		python-serial \
		python-scipy \
		vorbis-tools \
		python-pyaudio \
        python-gst0.10 python-scipy \
	&& python2 -m pip install --upgrade pip \
	&& python2 -m pip install rospkg catkin_pkg \
	&& python2 -m pip install boto3 soundfile \
	&& rm -rf /var/lib/apt/lists/* 

# Setup Pycharm
RUN \
	wget https://download.jetbrains.com/python/pycharm-community-2019.2.5.tar.gz?_ga=2.206607891.1099553149.1574619599-1281313269.1574206878 \
	&& mv pycharm-community-* pycharm-community.tar.gz \
	&& tar xfz pycharm-*.tar.gz -C /opt/ \
	&& rm pycharm-community.tar.gz \
	&& echo 'alias pycharm="/opt/pycharm-community-2019.2.5/bin/pycharm.sh"' >> /root/.bashrc 

# Install Atom
RUN \
	add-apt-repository ppa:webupd8team/atom \
	&& apt-get update -y \
	&& apt-get install -y atom \
	&& rm -rf /var/lib/apt/lists/* 


# For convenience add a source script to bashrc and update without clearing
RUN \
       echo 'source /root/.setup_script.sh' >> /root/.bashrc \
       && apt-get update -y && apt-get upgrade -y \
