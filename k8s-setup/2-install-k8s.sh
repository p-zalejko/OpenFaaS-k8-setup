#home dir
USER_HOME=/home/rock64
USER_NAME=$(whoami)

# Install kubernetes
KUBERNETES_VERSION="1.13.3"
apt-get install -y kubelet=${KUBERNETES_VERSION}-00 kubeadm=${KUBERNETES_VERSION}-00 kubectl=${KUBERNETES_VERSION}-00

kubeadm config images pull
kubeadm init

mkdir -p $USER_HOME/.kube
sysctl net.bridge.bridge-nf-call-iptables=1

echo "waiting for k8s setup..."
sleep 30

cp -i /etc/kubernetes/admin.conf $USER_HOME/.kube/config
chown -R $USER_NAME:$USER_NAME $USER_HOME/.kube

# Install Weave Net as overlay network
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

# Taint the master node so application pods can run on it too
kubectl taint nodes --all node-role.kubernetes.io/master-