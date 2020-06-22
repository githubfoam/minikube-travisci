IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-openesb:
	bash app/deploy-minikube.sh
deploy-openesb:
	bash app/deploy-openesb.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
