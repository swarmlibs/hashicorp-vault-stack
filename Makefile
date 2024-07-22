telemetry := false
DOCKER_STACK_COMPOSE_FILES := -c docker-stack.yml

ifeq ($(telemetry), true)
DOCKER_STACK_COMPOSE_FILES += -c docker-stack-telemetry.yml
endif

.EXPORT_ALL_VARIABLES:
DOCKER_STACK_NAME := vault
include .dockerenv
include .env
VAULT_RAFT_STORAGE_CONFIG := $(shell seq -f "retry_join { leader_api_addr = \"http://replica-%g.vault-internal:8200\" }" -s " " $(DOCKER_SERVICE_VAULT_REPLICAS))

make:
	@docker stack config $(DOCKER_STACK_COMPOSE_FILES)
deploy:
	@docker stack deploy $(DOCKER_STACK_COMPOSE_FILES) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
