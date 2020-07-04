#!/bin/bash
set -eox pipefail #safety for script

echo "=============================minikube============================================================="
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
# install wo snap
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/ # Download kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ # Download minikube
mkdir -p $HOME/.kube $HOME/.minikube
touch $KUBECONFIG
sudo minikube start --profile=minikube --vm-driver=none --kubernetes-version=v$KUBERNETES_VERSION #the none driver, the kubectl config and credentials generated are owned by root in the root user’s home directory
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

# https://rancher.com/blog/2019/introducing-rio/
#https://github.com/rancher/rio
echo "=============================rio============================================================="

# Installing rio to /usr/local/bin/rio
# command not found
# app/deploy-rio.sh: line 54: [INFO]: command not found
# ls -lai /usr/local/bin
# `curl -sfL https://get.rio.io | sh -` #Download the latest release
# ls -lai /usr/local/bin

export INSTALL_RIO_VERSION="v0.7.1"
`curl -sfL https://get.rio.io | INSTALL_RIO_VERSION=${version} sh -`  #

rio -n rio-system pods #Make sure all the pods are up and running

 rio install
 rio run https://github.com/rancher/rio-demo
 rio ps
 rio info
# rio console

# Run a sample service
rio run -p 80:8080 https://github.com/rancher/rio-demo
rio ps
rio info

# https://rancher.com/blog/2019/rio-revolutionizing-the-way-you-deploy-apps
rio run https://github.com/ebauman/rio-demo
# rio run ebauman/demo-rio:v1
rio ps
rio endpoints
