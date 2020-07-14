#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

git clone https://github.com/joakimhew/locust-kubernetes.git && cd locust-kubernetes && ls -lai

# Set docker environment to minikube
eval $(minikube docker-env)

# Initialize helm
helm init

# Build docker image
docker build docker-image -t locust-tasks:latest

# Install helm charts onto kubernetes cluster
helm install loadtest-chart --name locust

# List services to find locust URL
minikube service list
