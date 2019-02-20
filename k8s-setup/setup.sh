#!/bin/sh

#get the latest minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo cp minikube /usr/local/bin && rm minikube

# minikube --memory 8192 --cpus 4 start


