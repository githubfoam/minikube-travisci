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
for i in {1..60}; do # Timeout after 3 minutes, 60x3=300 secs
  if kubectl get pods --namespace=weave  | grep Pending ; then
      sleep 3
  else
      break
  fi
done

kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040
curl http://127.0.0.1:4040

# Kubernetes (local clone) Minikube is a simple option
# git clone https://github.com/weaveworks/scope && cd scope
# kubectl apply -f examples/k8s #deploy Scope
# kubectl port-forward svc/weave-scope-app -n weave 4040:80 #Port-forward to access weave-scope-app
# curl http://127.0.0.1:4040