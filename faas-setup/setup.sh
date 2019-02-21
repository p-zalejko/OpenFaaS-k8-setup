#!/bin/sh

# see
# https://medium.com/devopslinks/getting-started-with-openfaas-on-minikube-634502c7acdf
#

# faas CLI
curl -sL cli.openfaas.com | sudo sh

kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
helm repo add openfaas https://openfaas.github.io/faas-netes/
helm repo update

sleep 10

export PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
echo $PASSWORD

kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password="$PASSWORD"
helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set functionNamespace=openfaas-fn --set basic_auth=true

#export MINIKUBE_IP=192.168.99.100
export MINIKUBE_IP=$(minikube ip)
export OPENFAAS_URL=$MINIKUBE_IP:31112
echo $OPENFAAS_URL

#echo -n $PASSWORD | faas-cli login -g http://$OPENFAAS_URL -u admin — password-stdin
faas-cli login -u admin -p $PASSWORD -g http://$OPENFAAS_URL


