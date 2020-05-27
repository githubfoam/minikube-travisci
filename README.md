# minikube-travisci
minikube pipeline

Travis (.com) dev branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=master)](https://travis-ci.com/githubfoam/minikube-travisci)  

~~~~

Linux none (bare-metal) driver    
    Most users of this driver should consider the newer Docker driver, as it is significantly easier to configure and does not require root access. The ‘none’ driver is recommended for advanced users only.
    Requirements

    A Linux VM with the following:

        Docker
        systemd (OpenRC based systems are also supported in v1.10+)

	This VM must also meet the kubeadm requirement

  https://minikube.sigs.k8s.io/docs/drivers/none/
~~~~
~~~~

Installing kubeadm
https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
~~~~
~~~~
To work with KVM, minikube uses the libvirt virtualization API
Requirements
    libvirt v1.3.1 or higher
    qemu-kvm v2.0 or higher
https://minikube.sigs.k8s.io/docs/drivers/kvm2/

~~~~
