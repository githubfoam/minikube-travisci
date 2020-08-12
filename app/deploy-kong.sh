#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# https://github.com/Kong/kong-dist-kubernetes
# https://docs.konghq.com/1.4.x/kong-for-kubernetes/
echo "=============================deploy kong============================================================="

kubectl apply -f https://raw.githubusercontent.com/Kong/kong-dist-kubernetes/master/minikube/postgres.yaml
kubectl apply -f https://raw.githubusercontent.com/Kong/kong-dist-kubernetes/master/minikube/kong_migration_postgres.yaml
kubectl apply -f https://raw.githubusercontent.com/Kong/kong-dist-kubernetes/master/minikube/kong_postgres.yam

kubectl get deployment kong-rc


# echo "=========================================================================================="
# echo "Waiting for  the Kong control plane to be ready ..."
#   for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
#     if kubectl get pods --namespace=kube-system -lk8s-app=kube-dns|grep Running ; then
#       break
#     fi
#     sleep 2
#   done

echo "============================status check=============================================================="
minikube status
kubectl cluster-info
kubectl get pods --all-namespaces
kubectl get pods -n default
kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces

# Run the two mock services
docker build --no-cache -t kong:mesh-config  . -f Dockerfile.kong-config

kubectl apply -f serviceb.yaml
kubectl apply -f servicea.yaml

# Service B logs
kubectl logs -l app=serviceb -c serviceb

# Kong mesh logs
kubectl logs -l app=servicea -c kong
