#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${PROMETHEUS_OPERATOR_VERSION}" ]] && PROMETHEUS_OPERATOR_VERSION='0.1.7'

###################################################################################################

helm upgrade monitoring stable/prometheus-operator --install --debug --namespace monitoring --version "${PROMETHEUS_OPERATOR_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################
