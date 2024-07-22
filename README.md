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
make install
#
# To uninstall the stack, run the following command:
# make uninstall
```

Please see the many options supported in the `.env` file. These are also fully documented directly on the [Vault website](https://developer.hashicorp.com/vault/docs/configuration) along with more detailed installation instructions.
