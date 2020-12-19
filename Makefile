DEBUG ?= 1

HELM ?= helm upgrade --install --create-namespace
ifeq ($(DEBUG),1)
	HELM = helm template --dependency-update
endif

apply:
	$(HELM) --namespace=harbor harbor ./helm

uninstall:
	helm uninstall --namespace=harbor harbor

dep:
	git submodule update --remote --force
