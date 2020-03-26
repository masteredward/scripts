#!/bin/bash

# System Update
sudo apt update
sudo apt full-upgrade -y

# Docker CE
sudo apt install apt-transport-https gnupg-agent -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Docker Compose (Latest)
LATEST_URL=`curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest`
COMPOSE_VERSION=${LATEST_URL##*/}
DOWNLOAD_URL=https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m`
sudo curl -L ${DOWNLOAD_URL} -o /usr/local/bin/docker-compose
sudo chmod 755 /usr/local/bin/docker-compose