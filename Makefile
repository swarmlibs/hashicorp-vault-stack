.EXPORT_ALL_VARIABLES:
DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILE := docker-stack.yml
DOCKER_SERVICE_VAULT_REPLICAS := 3
include .dockerenv
include .env
VAULT_RAFT_STORAGE_CONFIG := $(shell seq -f "retry_join { leader_api_addr = \"http://replica-%g.vault-internal:8200\" }" -s " " ${DOCKER_SERVICE_VAULT_REPLICAS})

make:
	@docker stack config -c $(DOCKER_STACK_COMPOSE_FILE)
deploy:
	@docker stack deploy -c $(DOCKER_STACK_COMPOSE_FILE) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
