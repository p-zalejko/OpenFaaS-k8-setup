#!/bin/sh

# install docker and other dependencies
apt-get update -y
apt-get upgrade

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    nfs-kernel-server \
    nfs-common 

systemctl enable nfs-kernel-server

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y

# install a supported version of docker
# get all versions
# apt-cache madison docker-ce
apt-get install docker-ce=18.06.1~ce~3-0~debian
apt-get install docker-compose 
usermod -aG docker $USER
