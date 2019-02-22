#!/bin/sh

# helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

helm init --tiller-image=jessestuart/tiller:v2.12.3

# For non-production use, the role binding of cluster-admin and default/kube-system can be found below:
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:defaul

# Create a service account for Helm’s server component (tiller)
#kubectl -n kube-system create sa tiller && kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

# Install tiller which is Helm’s server-side component
#helm init --skip-refresh --upgrade --service-account tiller