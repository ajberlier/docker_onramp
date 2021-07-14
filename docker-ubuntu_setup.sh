# uninstall current versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# download and run docker install convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# create docker group and add current user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 

# enable docker service on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service