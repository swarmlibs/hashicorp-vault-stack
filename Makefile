DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILE := docker-stack.yml

.EXPORT_ALL_VARIABLES:
-include .env
VAULT_STACK_REPLICAS := 3
VAULT_STACK_STORAGE_CONFIG := $(shell seq 1 $(VAULT_STACK_REPLICAS) | xargs -I {} echo "retry_join { leader_api_addr = \"http://replica-{}.vault-internal:8200\" }")

make:
	@docker stack config -c $(DOCKER_STACK_COMPOSE_FILE)
deploy:
	@docker stack deploy -c $(DOCKER_STACK_COMPOSE_FILE) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
