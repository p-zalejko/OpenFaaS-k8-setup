#!/bin/sh

helm package helm-chart --debug
helm install helm-chart-0.1.0.tgz --name k8s-base-components --replace