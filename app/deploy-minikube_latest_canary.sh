#!/bin/bash
set -eox pipefail #safety for script

echo "=============================openEBS============================================================="
if [[ $(egrep -c '(vmx|svm)' /proc/cpuinfo) == 0 ]]; then #check if virtualization is supported on Linux, xenial fails w 0, bionic works w 2
           echo "virtualization is not supported"
  else
        echo "===================================="
        echo eval "$(egrep -c '(vmx|svm)' /proc/cpuinfo)" 2>/dev/null
        echo "===================================="
        echo "virtualization is supported"
fi
sudo apt-get -qq -y install conntrack #http://conntrack-tools.netfilter.org/
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/ # Download kubectl
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ # Download minikube
mkdir -p $HOME/.kube $HOME/.minikube
touch $KUBECONFIG
sudo minikube start --profile=minikube --vm-driver=none --kubernetes-version=v$KUBERNETES_VERSION #the none driver, the kubectl config and credentials generated are owned by root in the root user’s home directory
minikube update-context --profile=minikube
chown -R travis: /home/travis/.minikube/
eval "$(minikube docker-env --profile=minikube)" && export DOCKER_CLI='docker'
echo "=========================================================================================="
kubectl version --client #ensure the version
kubectl cluster-info
minikube status
echo "=========================================================================================="
|
  echo "Waiting for Kubernetes to be ready ..."
  for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
    if kubectl get pods --namespace=kube-system -lk8s-app=kube-dns|grep Running ; then
      break
    fi
    sleep 2
  done
# |
#   echo "Waiting for Kubernetes to be ready ..."
#   for i in {1..150}; do # Timeout after 5 minutes, 150x2=300 secs
#     if kubectl get pods --namespace=kube-system -lcomponent=kube-addon-manager|grep Running && \
#        kubectl get pods --namespace=kube-system -lk8s-app=kube-dns|grep Running ; then
#       break
#     fi
#     sleep 2
#   done
echo "============================status check=============================================================="
minikube status
kubectl cluster-info
kubectl get pods --all-namespaces;
kubectl get pods -n default;
# echo "=============================Inspection============================================================="
# - kubectl get pod -o wide #The IP column will contain the internal cluster IP address for each pod.
# - kubectl get service --all-namespaces # find a Service IP,list all services in all namespaces
# #linkerd
# - sudo sh -c "curl -sL https://run.linkerd.io/install | sh" #Install the CLI
# - export PATH=$PATH:$HOME/.linkerd2/bin
# - linkerd version
# - linkerd check --pre #Validate your Kubernetes cluster
# - sudo sh -c "linkerd install | kubectl apply -f -" #Install Linkerd onto the cluster
# - linkerd check
# - sudo kubectl -n linkerd get deploy
# - linkerd dashboard &
# # - linkerd -n linkerd top deploy/linkerd-web
# #Install the demo app
# - sudo sh -c "curl -sL https://run.linkerd.io/emojivoto.yml | kubectl apply -f -"
# - sudo kubectl -n emojivoto port-forward svc/web-svc 8080:80 #forward web-svc locally to port 8080
# #add Linkerd to emojivoto
# - sudo sh -c "kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -"
# #Just as with the control plane, it is possible to verify that everything worked the way it should with the data plane
# - linkerd -n emojivoto check --proxy
# - linkerd -n emojivoto stat deploy #see live traffic metrics by running
# - linkerd -n emojivoto top deploy #get a real-time view of which paths are being called:
# - linkerd -n emojivoto tap deploy/web #use tap shows the stream of requests across a single pod, deployment, or even everything in the emojivoto namespace
# #Install Flagger in the linkerd namespace
# - sudo kubectl apply -k github.com/weaveworks/flagger//kustomize/linkerd
# #Create a test namespace and enable Linkerd proxy injection
# - sudo kubectl create ns test
# - sudo kubectl annotate namespace test linkerd.io/inject=enabled
# #Install the load testing service to generate traffic during the canary analysis
# - sudo kubectl apply -k github.com/weaveworks/flagger//kustomize/tester
# #Create a deployment and a horizontal pod autoscaler:
# - sudo kubectl apply -k github.com/weaveworks/flagger//kustomize/podinfo
# #Create a canary custom resource for the podinfo deploymen
# - sudo kubectl apply -f canary/podinfo-canary.yaml
# #Trigger a canary deployment by updating the container image
# - sudo kubectl -n test set image deployment/podinfo podinfod=stefanprodan/podinfo:3.1.1
# - sudo kubectl -n test describe canary/podinfo
# # monitor all canaries
# - watch kubectl get canaries --all-namespaces
# #Automated rollback
# #Trigger another canary deployment
# - sudo kubectl -n test set image deployment/podinfo podinfod=stefanprodan/podinfo:3.1.2
# #Exec into the load tester pod
# # - sudo kubectl -n test exec -it flagger-loadtester-xx-xx sh
# #Generate HTTP 500 errors
# # - watch -n 1 curl http://podinfo-canary.test:9898/status/500
# #Generate latency
# - watch -n 1 curl http://podinfo-canary.test:9898/delay/1
# - kubectl -n test describe canary/podinfo
# #Trigger a canary deployment by updating the container image
# - sudo kubectl -n test set image deployment/podinfo podinfod=stefanprodan/podinfo:3.1.3
# #Generate 404s
# - watch -n 1 curl http://podinfo-canary:9898/status/404
# #Watch Flagger logs
# - sudo kubectl -n linkerd logs deployment/flagger -f | jq .msg
# #There are two ingress controllers that are compatible with both Flagger and Linkerd: NGINX and Gloo
# #Install NGINX
# - sudo helm upgrade -i nginx-ingress stable/nginx-ingress --namespace ingress-nginx
