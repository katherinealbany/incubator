#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${CERT_MANAGER_VERSION}"       ]] && CERT_MANAGER_VERSION='0.5.0'
[[ -z "${CERT_MANAGER_REPLICA_COUNT}" ]] && CERT_MANAGER_REPLICA_COUNT='3'

###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --debug --wait --namespace cert-manager --version "${CERT_MANAGER_VERSION}" --values "${BASE}/values.yaml" --set "replicaCount=${CERT_MANAGER_REPLICA_COUNT}"

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt-staging.yaml"
kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################
