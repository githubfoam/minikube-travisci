sudo apt-get install lxd
which lxc
which lxd
lxc init
lxc profile list
lxc profile copy default k8s
lxc profile show k8s
lxc profile edit k8s # Use the configuration with quota and limits
lxc list

sudo systemctl status lxd

getent group lxd
sudo gpasswd -a qvamjak lxd
newgrp lxd
groups




lxc launch images:centos/7 kmaster --profile k8s
lxc launch images:centos/7 kworker --profile k8s

cat bootstrap-kube.sh | lxc exec kmaster bash
cat bootstrap-kube.sh | lxc exec kworker bash

lxc list

lxc exec kmaster bash

kubectl cluster-info

kubectl get pods --all-namespaces

kubectl get cs // Health of the cluster

systemctl status kubelet
kubectl run nginx --image nginx
kubectl scale deploy nginx --replicas=3

free-m # To check the memory
nproc # To check the CPU
uname -r # Kernel
lsb_release -dirc # Linux Distribution

lxc config set kmaster limits.memory 2048MB # Memory change
lxc config show kmaster | less # Display Configuration
lxc remote list # List of all Repositories

lxc file push <filename> <machinename>/root/
