# minikube-travisci
minikube pipeline

Travis (.com) dev branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=dev)](https://travis-ci.com/githubfoam/minikube-travisci)  

~~~~
Enabling NVIDIA GPU

Aborting: NVIDIA kernel module not loaded.

Please ensure you have CUDA capable hardware and the NVIDIA drivers installed.

Failed to enable gpu
https://travis-ci.com/github/githubfoam/minikube-travisci/jobs/341676820

#https://istio.io/docs/setup/platform-setup/microk8s/

#https://microk8s.io/#get-started

#https://microk8s.io/docs

#https://istio.io/docs/setup/platform-setup/microk8s/

~~~~
~~~~
$ sudo microk8s status --wait-ready

microk8s is running

addons:

cilium: disabled

dashboard: disabled

dns: disabled

fluentd: disabled

gpu: disabled

helm: disabled

helm3: disabled

ingress: disabled

istio: disabled

jaeger: disabled

knative: disabled

kubeflow: disabled

linkerd: disabled

metallb: disabled

metrics-server: disabled

prometheus: disabled

rbac: disabled

registry: disabled

storage: disabled
~~~~
~~~~
The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters
https://kubernetes.io/docs/tasks/tools/install-kubectl/
Install Minikube
https://kubernetes.io/docs/tasks/tools/install-minikube/
~~~~
~~~~
The conntrack-tools are a set of free software userspace tools for Linux that allow system administrators interact with the Connection Tracking System, which is the module that provides stateful packet inspection for iptables. The conntrack-tools are the userspace daemon conntrackd and the command line interface conntrack.

The userspace daemon conntrackd can be used to enable high availability of cluster-based stateful firewalls and to collect statistics of the stateful firewall use
http://conntrack-tools.netfilter.org/
~~~~

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

~~~~
Follow these instructions to prepare minikube for Istio installation with sufficient resources to run Istio and some basic applications.

To enable the Secret Discovery Service (SDS) for your mesh, you must add extra configurations to your Kubernetes deployment. Refer to the api-server reference docs for the most up-to-date flags

For example, if you installed the KVM hypervisor, set the driver within the minikube configuration using the following command:
minikube config set driver kvm2
https://istio.io/docs/setup/platform-setup/minikube/

~~~~

~~~~
Multicluster Installation
Configure an Istio mesh spanning multiple Kubernetes clusters.
https://istio.io/docs/setup/install/multicluster/
~~~~

~~~~
kind is a tool for running local Kubernetes clusters using Docker container “nodes”.
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.
https://kind.sigs.k8s.io/
~~~~

~~~~
Please use the latest Go version.
To use kind, you will also need to install docker.
Install the latest version of kind.

https://istio.io/docs/setup/platform-setup/kind/
~~~~

~~~~
Kubernetes Gardener
https://istio.io/docs/setup/platform-setup/gardener/

Preparing the Setup
This setup is based on minikube, a Kubernetes cluster running on a single node. Docker for Desktop and kind are also supported.
https://github.com/gardener/gardener/blob/master/docs/development/local_setup.md

Audit a Kubernetes Cluster
The shoot cluster is a kubernetes cluster and its kube-apiserver handles the audit events. In order to define which audit events must be logged, a proper audit policy file must be passed to the kubernetes API server.
https://github.com/gardener/gardener/blob/master/docs/usage/shoot_auditpolicy.md


Kubernetes auditing provides a security-relevant chronological set of records documenting the sequence of activities that have affected system by individual users, administrators or other components of the system. It allows cluster administrator to answer the following questions:

    what happened?
    when did it happen?
    who initiated it?
    on what did it happen?
    where was it observed?
    from where was it initiated?
    to where was it going?
https://kubernetes.io/docs/tasks/debug-application-cluster/audit/
~~~~
