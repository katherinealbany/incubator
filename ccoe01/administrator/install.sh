#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${ADMINISTRATOR_VERSION}" ]] && ADMINISTRATOR_VERSION='1.0.1'

###################################################################################################

helm upgrade administrator ccoe/administrator --install --debug --wait --namespace administrator --version "${ADMINISTRATOR_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################
