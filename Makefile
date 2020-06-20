IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-kind:
	bash deploy-kind.sh
deploy-openesb:
	bash app/deploy-openesb.sh
deploy-istio:
	bash app/deploy-istio.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh
deploy-minikube:
	bash app/deploy-minikube.sh
deploy-java-maven:
	bash app/deploy-java-maven.sh	
push-image:
	docker push $(IMAGE)
.PHONY: deploy-kind deploy-openesb deploy-dashboard deploy-minikube deploy-istio push-image
