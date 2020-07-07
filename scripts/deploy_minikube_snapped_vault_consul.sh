#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace


echo "=============================minikube vault consul============================================================="
minikube
kubectl version --client
helm version

source helper.sh
#KUBERNETES_VERSION from snapped minikube?
# sudo minikube start --profile=cluster-1 --vm-driver=none --kubernetes-version=v$KUBERNETES_VERSION
# sudo minikube start --profile=cluster-2 --vm-driver=none --kubernetes-version=v$KUBERNETES_VERSION
sudo minikube start --profile=cluster-1 --vm-driver=none
sudo minikube start --profile=cluster-2 --vm-driver=none
minikube status
c1_kctx #helper.sh

# echo "============================consul vault=============================================================="
# echo $GOPATH
# mkdir $HOME/go #create a workspace, configure the GOPATH and add the workspace's bin folder to your system path
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# #TLS will be used to secure RPC communication between each Consul member
# #create a Certificate Authority (CA) to sign the certificates, via CloudFlare's SSL ToolKit (cfssl and cfssljson), and distribute keys to the nodes.
# go get -u github.com/cloudflare/cfssl/cmd/cfssl # install the SSL ToolKit
# go get -u github.com/cloudflare/cfssl/cmd/cfssljson
# # make workstation
# echo "============================consul vault=============================================================="
# - echo "============================consul vault=============================================================="
# - mkdir $HOME/go #create a workspace, configure the GOPATH and add the workspace's bin folder to your system path
# - export GOPATH=$HOME/go
# - export PATH=$PATH:$GOPATH/bin
# #TLS will be used to secure RPC communication between each Consul member
# #create a Certificate Authority (CA) to sign the certificates, via CloudFlare's SSL ToolKit (cfssl and cfssljson), and distribute keys to the nodes.
# - go get -u github.com/cloudflare/cfssl/cmd/cfssl # install the SSL ToolKit
# - go get -u github.com/cloudflare/cfssl/cmd/cfssljson
# - cfssl gencert -initca certs/config/ca-csr.json | cfssljson -bare certs/ca #Create a Certificate Authority
# - | #create a private key and a TLS certificate for Consul
#   cfssl gencert \
#     -ca=certs/ca.pem \
#     -ca-key=certs/ca-key.pem \
#     -config=certs/config/ca-config.json \
#     -profile=default \
#     certs/config/consul-csr.json | cfssljson -bare certs/consul
# - | #create a private key and a TLS certificate for Vault
#   cfssl gencert \
#     -ca=certs/ca.pem \
#     -ca-key=certs/ca-key.pem \
#     -config=certs/config/ca-config.json \
#     -profile=default \
#     certs/config/vault-csr.json | cfssljson -bare certs/vault
# - echo "============================consul vault=============================================================="
