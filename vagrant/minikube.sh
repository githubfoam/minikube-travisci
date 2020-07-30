#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

#https://minikube.sigs.k8s.io/docs/start/
#https://github.com/kubernetes/minikube
echo "============================Install minikube started =============================================================="

if [[ $(egrep -c '(vmx|svm)' /proc/cpuinfo) == 0 ]]; then #check if virtualization is supported on Linux, xenial fails w 0, bionic works w 2
           echo "virtualization is not supported"
  else
        echo "===================================="
        echo eval "$(egrep -c '(vmx|svm)' /proc/cpuinfo)" 2>/dev/null
        echo "===================================="
        echo "virtualization is supported"
fi

# overriding travisci global env variables
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECTL_VERSION=1.18.3
export KUBERNETES_VERSION=1.18.3
export MINIKUBE_VERSION=1.18.3
export MINIKUBE_HOME=$HOME #(string) sets the path for the .minikube directory that minikube uses for state/configuration. Please note: this is used only by minikube https://minikube.sigs.k8s.io/docs/handbook/config
export KUBECONFIG=$HOME/.kube/config

apt-get update && apt-get -qq -y install conntrack #http://conntrack-tools.netfilter.org/

# install wo snap kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/ # Download kubectl

# install wo snap minikubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ # Download minikube
mkdir -p $HOME/.kube $HOME/.minikube
touch $KUBECONFIG

sudo minikube start --profile=minikube \
                    --vm-driver=none \
                    --kubernetes-version=v$KUBERNETES_VERSION #the none driver, the kubectl config and credentials generated are owned by root in the root user’s home directory
                    --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus 1 #Requested cpu count 1 is less than the minimum allowed of 2
                    --v=5 #verbose
minikube update-context --profile=minikube
chown -R travis: /home/travis/.minikube/

eval "$(minikube docker-env --profile=minikube)" && export DOCKER_CLI='docker'
echo "=========================================================================================="
kubectl version --client #ensure the version
kubectl cluster-info
minikube status
echo "=========================================================================================="
echo "Waiting for kubernetes to be ready ..."
  for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
    if kubectl get pods --namespace=kube-system -lk8s-app=kube-dns|grep Running ; then
      break
    fi
    sleep 2
  done
echo "============================status check=============================================================="
minikube status
kubectl cluster-info
kubectl get pods --all-namespaces;
kubectl get pods -n default;
kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces




# export MINIKUBE_WANTUPDATENOTIFICATION=false
# export MINIKUBE_WANTREPORTERRORPROMPT=false
# export MINIKUBE_HOME=$HOME
# export CHANGE_MINIKUBE_NONE_USER=true
# export KUBECONFIG=$HOME/.kube/config

# mkdir -p $HOME/.kube
# mkdir -p $HOME/.minikube

# touch $KUBECONFIG

# #Kubernetes requirements
# apt-get install conntrack socat -qqy

# # Install Minikube
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null
# install minikube-linux-amd64 /usr/local/bin/minikube 
# minikube version

# # minikube start --vm-driver=none --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf

# # [WARNING Swap]: running with swap on is not supported. Please disable swap
# swapoff -a
# # [WARNING Service-Kubelet]: kubelet service is not enabled, please run 'systemctl enable kubelet.service'
# # systemctl enable kubelet.service

# #starts Minikube with 6 CPUs, 12288 memory, 120G disk size
# minikube start --vm-driver=none \
#                 --cpus 6 \
#                 --memory 12288 \
#                 --disk-size=20g \
#                 --extra-config=apiserver.authorization-mode=RBAC \
#                 --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf \
#                 --extra-config kubeadm.ignore-preflight-errors=SystemVerification \
#                 --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus 1 #Requested cpu count 1 is less than the minimum allowed of 2
#                 --v=5 #verbose
# # Interact with your cluster If you already have kubectl installed
# # kubectl get po -A

# # minikube kubectl -- get po -A

# # echo "============================Install kubectl finished =============================================================="