#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# https://github.com/quay/clair
echo "=============================scan images w clair============================================================="
kubectl create secret generic clairsecret --from-file=./config.yaml
kubectl get secret
kubectl create -f clair-kubernetes.yaml
sleep 1200 #20 mins

