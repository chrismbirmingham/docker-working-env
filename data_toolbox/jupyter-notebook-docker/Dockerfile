FROM nvidia/cuda:10.1-base-ubuntu18.04

# ==================================================================
# Abstractions for apt installation
RUN \
    apt-get update -y && apt-get upgrade -y \
    && apt-get install -y \
    software-properties-common \
    apt-utils \
    && \
    APT_INSTALL="apt-get install -y --no-install-recommends" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    # BUILD TOOLS
    build-essential \
    ca-certificates \
    # DOWNLOAD TOOLS
    curl \
    wget \
    zsh \
    unzip \
    # COMPILERS
    g++ \
    cmake \
    # VERSION CONTROL
    git \
    git-gui \
    meld \
    # BASIC EDITORS
    gedit \
    vim \
    fonts-powerline \
    emacs \
    nano \
    nautilus \
    # TERMINAL TOOLS
    terminator \
    tmux \
    sudo \
    # MISC. TOOLS
    htop \
    vlc \
    python-keybinder \
    python-notify \
    # GRAPHICS UTILS
    libcanberra-gtk-module \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    npm \
    && sed -i 's/geteuid/getppid/' /usr/bin/vlc \
    && rm -rf /var/lib/apt/lists/* 


# ==================================================================
# Setup Python3.6 with pip, virtualenv
RUN \
    APT_INSTALL="apt-get install -y --no-install-recommends" \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && apt-get update -y && apt-get upgrade -y \
    && apt-get install -y \
    && DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    python3.6 \
    python3.6-dev \
    python3-pip \
    python3-virtualenv \
    # ROS
    python3-yaml \
    && python3.6 -m pip install --upgrade pip \
    && python3.6 -m pip install \
    setuptools \
    && python3.6 -m pip install \
    jupyterlab "ipywidgets==7.5" \
    numpy \
    cython \
    # DATA SCIENCE TOOLS
    && python3.6 -m pip install \
    pandas \
    sklearn \
    statsmodels \
    hmmlearn \
    pmdarima \
    torch torchvision \
    sktime \
    gpyopt \
    optuna \
    # VISUALIZATION
    && python3.6 -m pip install \
    matplotlib \
    seaborn \
    bokeh \
    plotly==4.8.0 \
    dill \
    mlflow \
    cufflinks \
    # MISC
    && python3.6 -m pip install \
    requests \
    schedule \
    freezegun \
    func_timeout \
    datetimerange \
    psycopg2-binary \
    adjustText \
    playsound \
    && python3.6 -m pip install --ignore-installed pyyaml \
    && rm -rf /var/lib/apt/lists/* 


# ==================================================================
# Setup Pycharm
RUN \
    wget https://download.jetbrains.com/python/pycharm-community-2019.2.5.tar.gz?_ga=2.206607891.1099553149.1574619599-1281313269.1574206878 \
    && mv pycharm-community-* pycharm-community.tar.gz \
    && tar xfz pycharm-*.tar.gz -C /opt/ \
    && rm pycharm-community.tar.gz \
    && echo 'alias pycharm="/opt/pycharm-community-2019.2.5/bin/pycharm.sh"' >> /root/.bashrc 

# ==================================================================
# Install Visual Studio Code
RUN \
    apt-get update -y \
    && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update -y \
    && apt-get install -y code \
    && rm -rf /var/lib/apt/lists/* 

RUN \
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    jupyter labextension install jupyterlab-plotly@4.8.1

RUN \
    echo 'source /root/.dev_setup_script.sh' >> /root/.bashrc \
    && apt-get update -y && apt-get upgrade -y