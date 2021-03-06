#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${VAULT_VERSION}" ]] && VAULT_VERSION='1.0.5'

###################################################################################################

helm upgrade vault ccoe/vault --install --debug --namespace vault --version "${VAULT_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################
