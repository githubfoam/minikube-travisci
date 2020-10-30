#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# https://github.com/quay/clair
echo "=============================scan images w clair============================================================="
# kubectl create secret generic clairsecr7et --from-file=./config.yaml
kubectl create secret generic clairsecret --from-file=app/clair/config.yaml
kubectl create secret generic clairsecret --from-file=app/clair/clair-kubernetes.yaml
kubectl get secret
# kubectl create -f clair-kubernetes.yaml
kubectl create -f app/clair/clair-kubernetes.yaml
sleep 1200 #20 mins

