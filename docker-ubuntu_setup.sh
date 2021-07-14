#!/bin/bash

# update apt package manager
sudo apt update

# uninstall current versions of docker
sudo apt remove docker docker-engine docker.io containerd runc

# install docker
sudo apt install docker.io

# create docker group and add current user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

# enable docker service on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# disaply docker version as a check
docker --version


