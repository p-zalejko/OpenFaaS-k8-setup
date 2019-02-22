#!/bin/sh

# Install Weave Net as overlay network
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

# Taint the master node so application pods can run on it too
kubectl taint nodes --all node-role.kubernetes.io/master-