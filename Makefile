.EXPORT_ALL_VARIABLES:
DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILES := -c vault-server.yml -c vault-proxy.yml

# Vault deployment
VAULT_STACK_IMAGE=hashicorp/vault
VAULT_STACK_IMAGE_TAG=1.17.2
VAULT_STACK_REPLICAS=1

# Vault extra configuration
VAULT_STACK_EXTRACONFIG_VERSION=v1

# Enable Vault Telemetry (vault-telemetry.yml)
VAULT_STACK_TELEMETRY_ENABLED=false

# Load .dockerenv file
include .dockerenv

# Check if Vault Telemetry is enabled
ifeq ($(VAULT_STACK_TELEMETRY_ENABLED), true)
DOCKER_STACK_COMPOSE_FILES += -c vault-telemetry.yml
endif

make:
	@docker stack config $(DOCKER_STACK_COMPOSE_FILES)
deploy:
	@docker stack deploy $(DOCKER_STACK_COMPOSE_FILES) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
