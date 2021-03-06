IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-weavescope:
	bash app/deploy-weavescope.sh
deploy-gluster:
	bash app/deploy-gluster.sh
deploy-minikube-latest:
	bash app/deploy-minikube_latest.sh
deploy-minikube:
	bash app/deploy-minikube.sh
deploy-kubeflow:
	bash app/deploy-kubeflow.sh
deploy-minikube:
	bash app/deploy-minikube.sh
deploy-openesb:
	bash app/deploy-openesb.sh
deploy-dashboard:
	bash app/deploy-dashboard.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-minikube deploy-openesb deploy-dashboard push-image
