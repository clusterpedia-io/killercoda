#!/bin/bash

set -x
set -o errexit
set -o nounset
set -o pipefail

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

scp kind-configuration.yaml node01:/root
ssh node01 "curl -Lo /usr/bin/kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64 && chmod +x /usr/bin/kind"
