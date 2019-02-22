#!/bin/sh

RELEASE_NAME=k8s-base-components

helm package helm-chart --debug
helm delete $RELEASE_NAME
helm install helm-chart-0.1.0.tgz --name $RELEASE_NAME --replace