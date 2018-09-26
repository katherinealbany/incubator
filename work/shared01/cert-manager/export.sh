#!/bin/bash -x
set -o pipefail

###################################################################################################

PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'

###################################################################################################

function assert_zero {
  ([[ "${1}" =~ ^[[:digit:]]+$ ]] && [[ "${1}" -eq 0 ]]) && return || exit 1
}

###################################################################################################

function assert_not_blank {
  (! ([[ -z "${1}" ]] || [[ "${1}" =~ ^[[:blank:]]+$ ]])) && return || exit 1
}

###################################################################################################

hash jq      ; assert_zero "${?}"
hash mkdir   ; assert_zero "${?}"
hash dirname ; assert_zero "${?}"
hash kubectl ; assert_zero "${?}"

###################################################################################################

[[ -n "${1}"    ]] && BASE="${1}"
[[ -z "${BASE}" ]] && BASE="$(dirname ${BASH_SOURCE[0]})"
assert_not_blank "${BASE}"

###################################################################################################

NAMESPACES="$(kubectl get namespaces --output=json | jq -r '.items[].metadata.name')" ; assert_zero "${?}"
for namespace in ${NAMESPACES}; do
  SECRETS="$(kubectl get secrets --namespace=${namespace} --field-selector=type=kubernetes.io/tls --selector=certmanager.k8s.io/certificate-name --output=json | jq -r '.items[].metadata.name')" ; assert_zero "${?}"
  for secret in ${SECRETS}; do
    mkdir -m 700 -p -v "${BASE}/${namespace}" ; assert_zero "${?}"
    kubectl get secret --namespace=${namespace} ${secret} --export --output=json > "${BASE}/${namespace}/${secret}" ; assert_zero "${?}"
    chmod -v 600 "${BASE}/${namespace}/${secret}"
  done
done

###################################################################################################
