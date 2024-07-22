# About
A docker stack deployment for HashiCorp Vault

## Prerequisites

To use the stack here, you must configured your Docker Swarm cluster. Setting up Docker Swarm is outside the scope of this README. Please refer to the Docker Swarm mode [documentation](https://docs.docker.com/engine/swarm/).

The versions required are:
- Docker Engine 22.0.0+ (with Docker Swarm mode)
- GNU Make 3.0+

## Usage

To install the latest version of this stack, run the following command:

```bash
gh repo clone swarmlibs/hashicorp-vault-stack
cd hashicorp-vault-stack
# 
# To list available versions, run the following command:
# git ls-remote
# 
# To switch to a specific version, run the following command:
# git checkout <version>
# 
# To deploy the stack, run the following command:
make deploy
#
# To remove the stack, run the following command:
make remove
```

The following environment variables are available for the Docker service, see `.dockerenv` file:
- `DOCKER_SERVICE_VAULT_IMAGE=hashicorp/vault`
- `DOCKER_SERVICE_VAULT_IMAGE_TAG=latest`
- `DOCKER_SERVICE_VAULT_REPLICAS=1`
- `DOCKER_SERVICE_VAULT_PUBLISH_PORT=8200`
- `DOCKER_SERVICE_VAULT_EXTRACONFIG_VERSION=v1`

The following environment variables are available for the Vault service, see `.env` file:
- `VAULT_API_ADDR`: The address to bind the API server to.
- `VAULT_REDIRECT_ADDR`: If not set, the value of `VAULT_API_ADDR` is used.
- `VAULT_LOG_LEVEL=info`

You can add extra configurations to Vault using the `extraconfig.hcl` file. These are also fully documented directly on the [Vault website](https://developer.hashicorp.com/vault/docs/configuration).
