#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://kubernetes.io/docs/tasks/tools/install-kubectl/
echo "============================Install kubectl started =============================================================="

# Install specific version
# export KUBECTLVERSION="1.18.0"
# curl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTLVERSION/bin/linux/amd64/kubectl

# Download the latest release
# Move the binary in to your PATH
# Make the kubectl binary executable
curl -LsO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

# ensure the version 
kubectl version --client
echo "============================Install kubectl finished =============================================================="