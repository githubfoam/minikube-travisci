IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-openesb:
	bash app/deploy-openesb.sh
deploy-minikube:
	bash app/deploy-minikube.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-kind deploy-openesb deploy-dashboard deploy-minikube deploy-istio push-image
