#!/bin/sh
# Copyright (c) Swarm Library Maintainers.
# SPDX-License-Identifier: MIT

set -e

ME=$(basename $0)

echo "==> [$ME] Generating raft storage configuration..."
{
    echo 'storage "raft" { '
    seq ${DOCKER_SERVICE_VAULT_REPLICAS:-1} | xargs -I {} echo "  retry_join { leader_api_addr = \"http://replica-{}.vault-internal:8200\" } "
    echo '}'
} > /vault/config/generated-raft-storage-config.hcl

echo "==> [$ME] Redirect command to original entrypoint..."
exec /usr/local/bin/docker-entrypoint.sh "$@"
