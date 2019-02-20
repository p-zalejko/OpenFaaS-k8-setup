#!/bin/sh

kubectl create namespace kafka 

kubectl apply -f zoo.yaml -n kafka
kubectl apply -f kafka-micro.yaml -n kafka
kubectl apply -f kafka-rest-proxy.yaml -n kafka
kubectl apply -f kafka-manager.yml -n kafka
