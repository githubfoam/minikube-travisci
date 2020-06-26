#!/bin/bash
# openesb component list
#https://github.com/openebs/openebs/blob/master/k8s/openebs-operator.yaml

echo "=============================gluster============================================================="
minikube dashboard & # the Kubernetes dashboard
kubectl cluster-info
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
kubectl get pods
kubectl get deployments
kubectl get events
kubectl config view
#Create a Service
kubectl expose deployment hello-node --type=LoadBalancer --port=8080 #Expose the Pod to the public internet
kubectl get services
minikube service hello-node
minikube addons list #List the currently supported addons
minikube addons enable storage-provisioner-gluster #Enable an addon
kubectl get pod,svc -n kube-system #View the created Pod and Service

# minikube addons disable  storage-provisioner-gluster
# minikube addons list
# # clean up the resources in the cluster
# kubectl delete service hello-node
# kubectl delete deployment hello-node
# minikube stop
# minikube delete #delete the Minikube VM
