#!/bin/bash
set -eox pipefail #safety for script

#https://microk8s.io/#get-started
#https://microk8s.io/docs
#https://istio.io/docs/setup/platform-setup/microk8s/
- sudo snap install microk8s --classic --channel=1.18/stable
- sudo usermod -a -G microk8s $USER #add your current user to the group and gain access to the .kube caching directory
# - sudo chown -f -R $USER ~/.kube
# - su - $USER # re-enter the session for the group update to take place
- sudo microk8s status --wait-ready #Check the status
- sudo microk8s kubectl get nodes
- sudo microk8s kubectl get services
# - alias kubectl='microk8s kubectl' #add an alias (append to ~/.bash_aliases)
- sudo microk8s  kubectl create deployment my-dep --image=busybox
- sudo microk8s kubectl get pods #Check the status
- sudo microk8s status --wait-ready
- sudo microk8s enable dns cilium dashboard fluentd helm helm3 ingress linkerd jaeger knative kubeflow metrics-server prometheus rbac registry storage#Use add-ons linkerd
# - microk8s stop
# - microk8s start
# - sudo microk8s enable dns dashboard registry #Turn on standard services
# - watch microk8s.kubectl get all --all-namespaces #check deployment progress
- echo "=========================================================================================="
- sudo microk8s kubectl version
- sudo microk8s kubectl version --client #the version of the client
- sudo microk8s kubectl cluster-info
- echo "=========================================================================================="
- |
  echo "Waiting for Kubernetes to be ready ..."
  for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
    if sudo microk8s kubectl get pods --namespace=kube-system | grep Running ; then
      break
    fi
    sleep 2
  done
- sudo microk8s kubectl get all --all-namespaces
- sudo microk8s kubectl run nginx --image nginx --replicas 3
- sudo microk8s kubectl get all --all-namespaces
