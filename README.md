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
```

To remove the stack, run the following command:

```bash
make remove
```

> [!IMPORTANT]
> The `make remove` command will remove the stack from the Docker Swarm cluster.
> It is a destructive operation and may lead to cluster instability if not used correctly.
>
> Due to the nature of Docker Swarm once the stack is removed,
> re-deploying the stack may cause the service to be created on a different node from the previous deployment.
>
> To avoid this, please prepare the `vaule-server.yml` file with the correct node placement constraints before re-deploying the stack.
> For more information, see the [Docker documentation](https://docs.docker.com/engine/swarm/services/#placement-constraints).

The following environment variables are available for the Docker service, see `.dockerenv` file:
- `VAULT_STACK_IMAGE=hashicorp/vault`
- `VAULT_STACK_IMAGE_TAG=latest`
- `VAULT_STACK_REPLICAS=1`
- `VAULT_STACK_PUBLISH_PORT=8200`
- `VAULT_STACK_EXTRACONFIG_VERSION=v1`

The following environment variables are available for the Vault service:
- `VAULT_API_ADDR`: The address to bind the API server to.
- `VAULT_REDIRECT_ADDR`: If not set, the value of `VAULT_API_ADDR` is used.
- `VAULT_LOG_LEVEL=info`

You can add extra configurations to Vault using the `server/extraconfig.hcl` file. These are also fully documented directly on the [Vault website](https://developer.hashicorp.com/vault/docs/configuration).
