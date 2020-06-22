#!/bin/bash

# https://www.kubeflow.org/docs/started/workstation/minikube-linux/
echo "=============================kubeflow============================================================="
#Install Docker CE
docker run hello-world

#Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.2.0/minikube-linux-amd64
chmod +x minikube
cp minikube /usr/local/bin/
rm minikube
#starts Minikube with 6 CPUs, 12288 memory, 120G disk size
minikube start --vm-driver=none --cpus 6 --memory 12288 --disk-size=120g --extra-config=apiserver.authorization-mode=RBAC --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf --extra-config kubeadm.ignore-preflight-errors=SystemVerification

# Installation of Kubeflow
# Download the kfctl v1.0.2 release
# https://github.com/kubeflow/kfctl/releases/download/v1.0.2/kfctl_v1.0.2-0-ga476281_linux.tar.gz
wget -nv https://github.com/kubeflow/kfctl/releases/download/v1.0.2/kfctl_v1.0.2-0-ga476281_linux.tar.gz
# Unpack the tar ball
# tar -xvf kfctl_v1.0.2_<platform>.tar.gz
tar -xvf kfctl_v1.0.2-0-ga476281_linux.tar.gz
ls -lai
# The following command is optional, to make kfctl binary easier to use.
# export PATH=$PATH:<path to where kfctl was unpacked>

# # kind create cluster --name openesb-testing
# # kubectl config use-context kind-openesb-testing
# kubectl cluster-info
# kubectl get pods --all-namespaces;
# kubectl get pods -n default;
# kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
# kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
# kubectl apply -f https://openebs.github.io/charts/openebs-operator.yaml #install OpenEBS
# kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces-
# kubectl get pods -n openebs -l openebs.io/component-name=openebs-localpv-provisioner #Observe localhost provisioner pod
# kubectl get sc #Check the storage Class
# echo echo "Waiting for openebs-localpv-provisioner component to be ready ..."
# for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if kubectl get pods --namespace=openebs -l openebs.io/component-name=openebs-localpv-provisioner | grep Running ; then
#         break
#       fi
#       sleep 5
# done
# echo echo "Waiting for maya-apiserver component to be ready ..."
# for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if kubectl get pods --namespace=openebs -l openebs.io/component-name=maya-apiserver | grep Running ; then
#         break
#       fi
#       sleep 5
# done
# echo echo "Waiting for openebs-ndm component to be ready ..."
# for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if kubectl get pods --namespace=openebs -l openebs.io/component-name=openebs-ndm | grep Running ; then
#         break
#       fi
#       sleep 5
# done
# echo echo "Waiting for openebs-ndm-operator component to be ready ..."
# for i in {1..60}; do # Timeout after 5 minutes, 150x5=300 secs
#       if kubectl get pods --namespace=openebs -l openebs.io/component-name=openebs-ndm-operator | grep Running ; then
#         break
#       fi
#       sleep 5
# done
# echo "Waiting for openesb to be ready ..."
#   for i in {1..60}; do # Timeout after 2 minutes, 60x2=300 secs
#       if kubectl get pods --namespace=openebs | grep Running ; then
#         break
#       fi
#       sleep 5
# done
# kubectl get pods --all-namespaces
# kubectl get pods --namespace=openebs
# kubectl get pod -n default -o wide  --all-namespaces
# # kind delete cluster --name openesb-testing
