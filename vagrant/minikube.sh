#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

#https://minikube.sigs.k8s.io/docs/start/
#https://github.com/kubernetes/minikube
echo "============================Install minikube started =============================================================="

export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config

mkdir -p $HOME/.kube
mkdir -p $HOME/.minikube

touch $KUBECONFIG

#Kubernetes requirements
apt-get install conntrack socat -qqy

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null
install minikube-linux-amd64 /usr/local/bin/minikube 
minikube version

# minikube start --vm-driver=none --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf

# [WARNING Swap]: running with swap on is not supported. Please disable swap
swapoff -a
# [WARNING Service-Kubelet]: kubelet service is not enabled, please run 'systemctl enable kubelet.service'
systemctl enable kubelet.service

#starts Minikube with 6 CPUs, 12288 memory, 120G disk size
minikube start --vm-driver=none \
                --cpus 6 \
                --memory 12288 \
                --disk-size=20g \
                --extra-config=apiserver.authorization-mode=RBAC \
                --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf \
                --extra-config kubeadm.ignore-preflight-errors=SystemVerification \
                --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus 1 #Requested cpu count 1 is less than the minimum allowed of 2
                --v=5 #verbose
# Interact with your cluster If you already have kubectl installed
# kubectl get po -A

# minikube kubectl -- get po -A

# echo "============================Install kubectl finished =============================================================="