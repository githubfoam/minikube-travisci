IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-minikube:
	bash app/deploy-minikube.sh
deploy-openesb:
	bash app/deploy-openesb.sh
deploy-minikube-latest-canary:
	bash app/deploy-minikube_latest_canary.sh
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
