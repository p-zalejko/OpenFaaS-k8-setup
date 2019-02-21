#!/bin/sh

# helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

# Create a service account for Helm’s server component (tiller)
kubectl -n kube-system create sa tiller && kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

# Install tiller which is Helm’s server-side component
helm init --skip-refresh --upgrade --service-account tiller