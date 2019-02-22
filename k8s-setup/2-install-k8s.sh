#!/bin/sh

USER_HOME=/home/rock64
USER_NAME=rock64

# Install kubernetes
KUBERNETES_VERSION="1.13.3"
apt-get install -y kubelet=${KUBERNETES_VERSION}-00 kubeadm=${KUBERNETES_VERSION}-00 kubectl=${KUBERNETES_VERSION}-00

kubeadm config images pull
kubeadm init

mkdir -p $USER_HOME/.kube
cp -i /etc/kubernetes/admin.conf $USER_HOME/.kube/config
chown -R $USER_NAME:$USER_NAME $USER_HOME/.kube

sysctl net.bridge.bridge-nf-call-iptables=1

