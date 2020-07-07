#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://rancher.com/blog/2019/introducing-rio/
#https://github.com/rancher/rio
echo "=============================rio============================================================="

# `curl -sfL https://get.rio.io | sh -` # command not found
curl -sfL https://get.rio.io | sh - #Download the latest release

# export version="v0.7.1"
# curl -sfL https://get.rio.io | INSTALL_RIO_VERSION=${version} sh -

rio -n rio-system pods #Make sure all the pods are up and running

# rio install #Please provide your Let's Encrypt email

# https://github.com/rancher/rio-demo
# rio run https://github.com/rancher/rio-demo
# rio ps
# rio info
# rio console

# Run a sample service
# rio run -p 80:8080 https://github.com/rancher/rio-demo
# rio ps
# rio info

# https://rancher.com/blog/2019/rio-revolutionizing-the-way-you-deploy-apps
# rio run https://github.com/ebauman/rio-demo
# rio run ebauman/demo-rio:v1
# rio ps
# rio endpoints
