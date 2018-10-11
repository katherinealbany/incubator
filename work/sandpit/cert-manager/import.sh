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

NAMESPACES=$(vault_list_flat ${CERT_MANAGER_VAULT_PATH}/)
for NAMESPACE in ${NAMESPACES}; do
  SECRETS=$(vault_list_flat ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE})
  for SECRET in ${SECRETS}; do
    MANIFEST=$(vault_read_field ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE}/${SECRET} manifest)
    echo ${MANIFEST} | jq -r '.data."tls.crt"' | base64 --decode | openssl x509 -checkend 0 ; EXPIRED="${?}"
    if [ ${EXPIRED} -eq 1 ]; then
      vault delete ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE}/${SECRET}
      [[ $(vault_list_flat ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE} | wc -l) -eq 0 ]] && vault delete ${CERT_MANAGER_VAULT_PATH}/${NAMESPACE}
    else
      set +e && kubectl get secret --namespace=${NAMESPACE} $(echo ${SECRET} | cut -d '/' -f 2) ; CREATE="${?}" && set -e
      if [ ${CREATE} -eq 1 ]; then
        set +e && kubectl get namespace ${NAMESPACE} ; CREATE="${?}" && set -e && [[ ${CREATE} -eq 1 ]] && kubectl create namespace ${NAMESPACE}
        echo ${MANIFEST} | kubectl create --namespace=${NAMESPACE} --filename=- --validate=true
      fi
    fi
  done
done

###################################################################################################
