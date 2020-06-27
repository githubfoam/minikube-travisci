#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# https://github.com/weaveworks/scope
# https://www.weave.works/docs/scope/latest/installing/#k8s
echo "=============================Weave Scope============================================================="

#Kubernetes
#install Weave Scope on your Kubernetes cluster
kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
echo echo "Waiting for Weave Scope to be ready ..."

kubectl cluster-info
kubectl get pods --all-namespaces;
kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.

for i in {1..60}; do # Timeout after 3 minutes, 60x3=300 secs
  if kubectl get pods --namespace=weave  | grep ContainerCreating ; then
      sleep 5
  else
      break
  fi
done

kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040 &
