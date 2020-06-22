IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-minikube:
	bash app/deploy-minikube.sh
deploy-openesb:
	bash app/deploy-openesb.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-minikube deploy-openesb deploy-dashboard push-image
