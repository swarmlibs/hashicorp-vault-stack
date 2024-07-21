DOCKER_STACK_NAME := vault
DOCKER_STACK_COMPOSE_FILE := docker-stack.yml
.EXPORT_ALL_VARIABLES:
-include .env
make:
	@docker stack config -c $(DOCKER_STACK_COMPOSE_FILE)
deploy:
	@docker stack deploy -c $(DOCKER_STACK_COMPOSE_FILE) $(DOCKER_STACK_NAME)
remove:
	@docker stack rm $(DOCKER_STACK_NAME)
