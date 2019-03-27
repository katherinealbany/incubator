#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${NGINX_INGRESS_VERSION}" ]] && NGINX_INGRESS_VERSION='1.0.1'

###################################################################################################

helm upgrade nginx-ingress stable/nginx-ingress --install --debug --wait --namespace nginx-ingress --version "${NGINX_INGRESS_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################

if [[ $(kubectl get customresourcedefinitions --output=custom-columns=:.metadata.name | grep servicemonitors.monitoring.coreos.com | wc -l | awk '{print $1}') -eq 1 ]]; then
  kubectl apply --record=true --wait=true --filename="${BASE}/service-monitor.yaml"
fi

###################################################################################################
