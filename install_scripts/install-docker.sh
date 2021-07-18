#!/bin/sh

# setup
sudo apt remove --yes docker docker-engine docker.io containerd runc
sudo apt update
sudo apt upgrade

# docker
sudo apt --yes install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt upgrade
sudo apt --yes install docker-ce docker-ce-cli containerd.io
printf '\n\nDocker version will be displayed below if installed successfully:\n'
docker --version
printf '\n'

# docker-compose
COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1`
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
printf '\n\nDocker Compose version will be displayed below if installed successfully:\n'
docker-compose --version
printf '\n'

