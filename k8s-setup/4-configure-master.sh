#!/bin/sh

# Taint the master node so application pods can run on it too
kubectl taint nodes --all node-role.kubernetes.io/master-