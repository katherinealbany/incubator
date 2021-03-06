#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${NGINX_INGRESS_VERSION}" ]] && NGINX_INGRESS_VERSION='0.28.3'

###################################################################################################

helm upgrade nginx-ingress stable/nginx-ingress --install --debug --wait --namespace nginx-ingress --version "${NGINX_INGRESS_VERSION}" --values "${BASE}/values.yaml"

###################################################################################################
