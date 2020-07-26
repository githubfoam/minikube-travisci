#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://docs.docker.com/engine/install/ubuntu/
echo "============================install docker started =============================================================="

# Uninstall old versions
sudo apt-get remove -qqy docker docker-engine docker.io containerd runc

# Install using the repository
# Set up the repository
apt-get update -qq
apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
/bin/sh -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"

# verify the key with the fingerprint
apt-key fingerprint 0EBFCD88

# set up the stable repository
add-apt-repository -y \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# Install the latest version of Docker Engine and containerd
apt-get update -qq
apt-get -qqy install docker-ce docker-ce-cli containerd.io

#add current user to the docker group
usermod -aG docker $USER

docker version 


echo "============================install docker finished =============================================================="