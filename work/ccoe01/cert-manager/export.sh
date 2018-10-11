#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

BASE=$(git rev-parse --show-toplevel)

. "${BASE}/support/scripts/vault.sh"

###################################################################################################

CERT_MANAGER_VAULT_PATH=$([[ -n "${1}" ]] && echo "${1}" || echo "${CERT_MANAGER_VAULT_PATH}")
validate_not_blank 'CERT_MANAGER_VAULT_PATH' "${CERT_MANAGER_VAULT_PATH}"

###################################################################################################

validate_not_blank 'VAULT_ROLE_ID'   "${VAULT_ROLE_ID}"
validate_not_blank 'VAULT_SECRET_ID' "${VAULT_SECRET_ID}"

vault_approle_login "${VAULT_ROLE_ID}" "${VAULT_SECRET_ID}"

###################################################################################################

NAMESPACES=$(kubectl get namespaces --output=json | jq -r '.items[].metadata.name')
for NAMESPACE in ${NAMESPACES}; do
  SECRETS=$(kubectl get secrets --namespace=${NAMESPACE} --field-selector=type=kubernetes.io/tls --selector=certmanager.k8s.io/certificate-name --output=json | jq -r '.items[].metadata.name')
  for SECRET in ${SECRETS}; do
    MANIFEST=$(kubectl get secret --namespace=${NAMESPACE} ${SECRET} --export --output=json)
    assert_not_blank "${MANIFEST}"

    vault write ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE}/${SECRET} manifest="${MANIFEST}"
  done
done

###################################################################################################
