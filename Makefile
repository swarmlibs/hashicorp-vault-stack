.EXPORT_ALL_VARIABLES:
DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILES := -c vault-server.yml -c vault-proxy.yml
include .dockerenv
include .env
ifeq ($(DOCKER_SERVICE_VAULT_TELEMETRY_ENABLED), true)
DOCKER_STACK_COMPOSE_FILES += -c vault-telemetry.yml
endif

make:
	@docker stack config $(DOCKER_STACK_COMPOSE_FILES)
deploy:
	@docker stack deploy $(DOCKER_STACK_COMPOSE_FILES) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
