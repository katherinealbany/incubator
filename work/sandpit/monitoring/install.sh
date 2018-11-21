#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${PROMETHEUS_OPERATOR_VERSION}" ]] && PROMETHEUS_OPERATOR_VERSION='0.1.25'

###################################################################################################

[[ $(kubectl get crd --output=custom-columns=:.metadata.name | grep monitoring.coreos.com | wc -l | awk '{print $1}') -eq 0 ]] && CREATE_CUSTOM_RESOURCE=true || CREATE_CUSTOM_RESOURCE=false

###################################################################################################

helm upgrade monitoring stable/prometheus-operator --install --debug --namespace monitoring --version "${PROMETHEUS_OPERATOR_VERSION}" --values "${BASE}/values.yaml" --set "prometheusOperator.createCustomResource=${CREATE_CUSTOM_RESOURCE}"

###################################################################################################

# https://github.com/helm/charts/tree/master/stable/prometheus-cloudwatch-exporter

###################################################################################################
