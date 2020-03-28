#!/bin/bash

#################################
# Install Docker
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
#################################

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Set up the repository

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker Engine - Community

# Update the apt package index.
sudo apt-get update

# Install the latest version of Docker Engine - Community and containerd
sudo apt-get install docker-ce docker-ce-cli containerd.io

docker -v

#################################
#Install Docker Compose
# https://docs.docker.com/compose/install/
#################################

# Uninstall Docker Compose if you installed using curl:
# sudo rm /usr/local/bin/docker-compose


# Download the current stable release of Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version
