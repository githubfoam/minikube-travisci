IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy_minikube_vault_consul:
	bash scripts/deploy_minikube_vault_consul.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-kind deploy-openesb deploy-dashboard deploy-dashboard-helm deploy-istio push-image
