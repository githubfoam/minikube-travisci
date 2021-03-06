# minikube-travisci
minikube pipeline

Travis (.com) branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=master)](https://travis-ci.com/githubfoam/minikube-travisci)  

Travis (.com) feature voting app branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=feature_votingapp)](https://travis-ci.com/githubfoam/minikube-travisci) 

Travis (.com) feature weavescope branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=feature_weavescope)](https://travis-ci.com/githubfoam/minikube-travisci) 


Travis (.com) feature_openebs branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=feature_openebs)](https://travis-ci.com/githubfoam/minikube-travisci)

Travis (.com) feature_kubeflow branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=feature_kubeflow)](https://travis-ci.com/githubfoam/minikube-travisci)

Travis (.com)  feature_k8s_dashboard  branch:
[![Build Status](https://travis-ci.com/githubfoam/minikube-travisci.svg?branch=feature_k8s_dashboard)](https://travis-ci.com/githubfoam/minikube-travisci)


~~~~
minikube with snap installation

$ which minikube

/snap/bin/minikube

/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

There is a newer version of minikube available (v1.11.0).  Download it here:

https://github.com/kubernetes/minikube/releases/tag/v1.11.0

To disable this notification, add WantUpdateNotification: False to the json config file at /root/snap/minikube/4/.minikube/config

(you may have to create the file config.json in this folder if you have no previous configuration)

Starting local Kubernetes cluster...

F0626 12:24:45.845983    6085 cluster.go:391] Unsupported driver: none
~~~~

smoke tests kubeflow
~~~~
Minikube + kubectl + Docker + kubeflow



[I 10:30:46.768 NotebookApp] Writing notebook server cookie secret to /home/travis/.local/share/jupyter/runtime/notebook_cookie_secret

[I 10:30:47.075 NotebookApp] Serving notebooks from local directory: /tmp/kubeflow/fairing/examples/mnist

[I 10:30:47.076 NotebookApp] The Jupyter Notebook is running at:

[I 10:30:47.080 NotebookApp] http://localhost:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

[I 10:30:47.081 NotebookApp]  or http://127.0.0.1:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

[I 10:30:47.082 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

[C 10:30:47.092 NotebookApp]



    To access the notebook, open this file in a browser:

        file:///home/travis/.local/share/jupyter/runtime/nbserver-30670-open.html

    Or copy and paste one of these URLs:

        http://localhost:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

     or http://127.0.0.1:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363


  Kubeflow dashboard
  http://10.30.1.35:31380

~~~~

smoke tests openEBS
~~~~
$ sudo kubectl get pods --namespace=openebs

NAME                                           READY   STATUS    RESTARTS   AGE

maya-apiserver-5d87746c75-gjzlv                0/1     Running   2          29s

openebs-admission-server-766f5d7c48-csscs      1/1     Running   0          28s

openebs-localpv-provisioner-695ffd78d6-72gwj   1/1     Running   0          28s

openebs-ndm-operator-58ccd48f9d-2lp7z          0/1     Running   1          28s

openebs-ndm-pxcz5                              1/1     Running   0          28s

openebs-provisioner-64c9565ccb-7pd8m           1/1     Running   0          28s

openebs-snapshot-operator-cf5cc6c54-8lh7g      2/2     Running   0          28s
~~~~

smoke tests k8s dashboard
~~~~
NAMESPACE              NAME                                                                      READY   STATUS    RESTARTS   AGE
kubernetes-dashboard   dashboard-metrics-scraper-6b4884c9d5-z7n86                                1/1     Running   0          12s

kubernetes-dashboard   kubernetes-dashboard-7bfbb48676-fbp9g                                     1/1     Running   0          12s
~~~~

~~~~
$ minikube addons list

|-----------------------------|----------|--------------|

|         ADDON NAME          | PROFILE  |    STATUS    |

|-----------------------------|----------|--------------|

| ambassador                  | minikube | disabled     |

| dashboard                   | minikube | disabled     |

| default-storageclass        | minikube | enabled ✅   |

| efk                         | minikube | disabled     |

| freshpod                    | minikube | disabled     |

| gvisor                      | minikube | disabled     |

| helm-tiller                 | minikube | disabled     |

| ingress                     | minikube | disabled     |

| ingress-dns                 | minikube | disabled     |

| istio                       | minikube | disabled     |

| istio-provisioner           | minikube | disabled     |

| logviewer                   | minikube | disabled     |

| metallb                     | minikube | disabled     |

| metrics-server              | minikube | disabled     |

| nvidia-driver-installer     | minikube | disabled     |

| nvidia-gpu-device-plugin    | minikube | disabled     |

| olm                         | minikube | disabled     |

| registry                    | minikube | disabled     |

| registry-aliases            | minikube | disabled     |

| registry-creds              | minikube | disabled     |

| storage-provisioner         | minikube | enabled ✅   |

| storage-provisioner-gluster | minikube | disabled     |

|-----------------------------|----------|--------------|
~~~~

storage-provisioner-gluster

~~~~
- storage-provisioner: enabled

- storage-provisioner-gluster: disabled

* storage-provisioner-gluster was successfully enabled


NAME                                   READY   STATUS    RESTARTS   AGE

pod/coredns-5c98db65d4-2bnkf           1/1     Running   1          73s

pod/coredns-5c98db65d4-lk6rw           1/1     Running   1          73s

pod/etcd-minikube                      1/1     Running   0          14s

pod/kube-addon-manager-minikube        1/1     Running   0          13s

pod/kube-apiserver-minikube            1/1     Running   0          5s

pod/kube-controller-manager-minikube   1/1     Running   0          19s

pod/kube-proxy-fxq4q                   1/1     Running   0          73s

pod/kube-scheduler-minikube            1/1     Running   0          4s

pod/storage-provisioner                1/1     Running   0          71s
~~~~
~~~~
There is a newer version of minikube available (v1.11.0).  Download it here:

https://github.com/kubernetes/minikube/releases/tag/v1.11.0

To disable this notification, add WantUpdateNotification: False to the json config file at /root/snap/minikube/4/.minikube/config
F0626 12:24:45.845983    6085 cluster.go:391] Unsupported driver: none

--cpus: command not found

The command "sudo minikube start --vm-driver=none \

                    --cpus 6 --memory 12288 \

                    --disk-size=120g \

                    --extra-config=apiserver.authorization-mode=RBAC \

                    --extra-config=kubelet.resolv-conf=/run/systemd/resolve/resolv.conf \

                    --extra-config kubeadm.ignore-preflight-errors=SystemVerification

~~~~

~~~~
minikube with snap installation
$ which minikube

/snap/bin/minikube

/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

There is a newer version of minikube available (v1.11.0).  Download it here:

https://github.com/kubernetes/minikube/releases/tag/v1.11.0

To disable this notification, add WantUpdateNotification: False to the json config file at /root/snap/minikube/4/.minikube/config

(you may have to create the file config.json in this folder if you have no previous configuration)

Starting local Kubernetes cluster...

F0626 12:24:45.845983    6085 cluster.go:391] Unsupported driver: none
~~~~

smoke tests kubeflow
~~~~
Minikube + kubectl + Docker + kubeflow



[I 10:30:46.768 NotebookApp] Writing notebook server cookie secret to /home/travis/.local/share/jupyter/runtime/notebook_cookie_secret

[I 10:30:47.075 NotebookApp] Serving notebooks from local directory: /tmp/kubeflow/fairing/examples/mnist

[I 10:30:47.076 NotebookApp] The Jupyter Notebook is running at:

[I 10:30:47.080 NotebookApp] http://localhost:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

[I 10:30:47.081 NotebookApp]  or http://127.0.0.1:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

[I 10:30:47.082 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

[C 10:30:47.092 NotebookApp]



    To access the notebook, open this file in a browser:

        file:///home/travis/.local/share/jupyter/runtime/nbserver-30670-open.html

    Or copy and paste one of these URLs:

        http://localhost:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363

     or http://127.0.0.1:8888/?token=8a8108714c8244b4849d9233a0a7feab02b2d33937b24363


  Kubeflow dashboard
  http://10.30.1.35:31380

~~~~


~~~~
Enabling NVIDIA GPU

Aborting: NVIDIA kernel module not loaded.

Please ensure you have CUDA capable hardware and the NVIDIA drivers installed.

Failed to enable gpu
https://travis-ci.com/github/githubfoam/minikube-travisci/jobs/341676820

Alternative installs - (MacOS/ Windows 10/Multipass)
Raspberry Pi/ARM
Multipass
With multipass installed, you can now create a VM to run MicroK8s. At least 4
Gigabytes of RAM and 40G of storage is recommended
https://microk8s.io/docs/install-alternatives#heading--arm

Installing Multipass for Windows
https://multipass.run/docs/installing-on-windows

Clustering with MicroK8s
https://microk8s.io/docs/clustering

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

~~~~
Linkerd adds critical security, observability, and reliability features to your Kubernetes stack—no code change required.
Linkerd offers out of the box many interesting features like
  automatic TLS,
  Automatic Proxy Injection,
  Dashboard and Grafana,
  Telemetry and Monitoring
  canary & blue/green deploys via the Traffic Split feature
https://linkerd.io/
~~~~
