#!/bin/bash

#update host
sudo su
apt-get update
apt-get upgrade -y

# install docker
apt update
echo y | apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt install docker-ce -y

#format data disk
mkdir /mnt/nextcloud
mkfs.ext4 /dev/xvdg
mount /dev/xvdg /mnt/nextcloud
chown -R ubuntu:ubuntu /mnt/nextcloud

# give docker permissions
sudo usermod -aG docker ubuntu
service docker restart

#install nextcloud
su ubuntu
docker pull nextcloud
docker run -d -v /mnt/nextcloud:/var/www/html -p 80:80 nextcloud