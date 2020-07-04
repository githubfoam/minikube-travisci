IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-rio:
	bash app/deploy-rio.sh

deploy-minikube:
	bash app/deploy-minikube.sh

deploy-openesb:
	bash app/deploy-openesb.sh

deploy-minikube-openfaas:
	bash app/deploy-minikube-openfaas.sh

deploy-minikube-latest-linkerd:
	bash app/deploy-minikube_latest_linkerd.sh

deploy-minikube-latest-canary-linkerd:
	bash app/deploy-minikube_latest_canary_linkerd.sh

deploy-minikube-latest-canary:
	bash app/deploy-minikube_latest_canary.sh

deploy-minikube-latest-knative:
	bash app/deploy-minikube_latest_knative.sh

deploy-minikube-latest-bluegreen:
	bash app/deploy-minikube_latest_bluegreen.sh

deploy-dashboard:
	bash app/deploy-dashboard.sh

deploy-minikube:
	bash app/deploy-minikube.sh

deploy-java-maven:
	bash app/deploy-java-maven.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-kind deploy-openesb deploy-dashboard deploy-minikube deploy-istio push-image
