DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILE := docker-stack.yml
DOCKER_SERVICE_VAULT_REPLICAS := 3

.EXPORT_ALL_VARIABLES:
-include .env
VAULT_RAFT_STORAGE_CONFIG := $(shell seq 1 $(DOCKER_SERVICE_VAULT_REPLICAS) | xargs -I {} echo "retry_join { leader_api_addr = \"http://replica-{}.vault-internal:8200\" }")

make:
	@docker stack config -c $(DOCKER_STACK_COMPOSE_FILE)
deploy:
	@docker stack deploy -c $(DOCKER_STACK_COMPOSE_FILE) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
