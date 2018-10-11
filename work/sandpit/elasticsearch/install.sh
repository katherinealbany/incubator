#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${ELASTICSEARCH_VERSION}" ]] && ELASTICSEARCH_VERSION='1.0.5'

###################################################################################################

helm upgrade elasticsearch ccoe/elasticsearch --install --debug --namespace elasticsearch --version "${ELASTICSEARCH_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################
