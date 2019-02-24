#!/bin/sh

kubectl create namespace kafka 

kubectl apply -f zoo.yaml -n kafka

# let's wait for zookeeper
sleep 45

kubectl apply -f kafka-micro.yaml -n kafka

# let's wait for kafka
sleep 60
kubectl apply -f kafka-manager.yml -n kafka
kubectl apply -f kafka-rest-proxy.yaml -n kafka
