#!/bin/sh

# see
# https://medium.com/devopslinks/getting-started-with-openfaas-on-minikube-634502c7acdf
# https://blog.alexellis.io/serverless-kubernetes-on-raspberry-pi/

#!/bin/sh

# faas CLI
curl -sL cli.openfaas.com | sudo sh

git clone https://github.com/openfaas/faas-netes

kubectl apply -f ./faas-netes/namespaces.yml
kubectl apply -f ./faas-netes/yaml_arm64
# expose faas dashboard via traefik
kubectl apply -f openfaaas-ingress.yaml

# from an external pc:
export OPENFAAS_URL=http://openfaas-gateway.internal.dom.com
faas-cli list