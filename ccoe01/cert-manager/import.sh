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
hash cat     ; assert_zero "${?}"
hash cut     ; assert_zero "${?}"
hash find    ; assert_zero "${?}"
hash mkdir   ; assert_zero "${?}"
hash base64  ; assert_zero "${?}"
hash dirname ; assert_zero "${?}"
hash kubectl ; assert_zero "${?}"
hash openssl ; assert_zero "${?}"

###################################################################################################

[[ -n "${1}"    ]] && BASE="${1}"
[[ -z "${BASE}" ]] && BASE="$(dirname ${BASH_SOURCE[0]})"

assert_not_blank "${BASE}"

###################################################################################################

mkdir -m 700 -p -v "${BASE}" ; assert_zero "${?}"
cd "${BASE}" ; assert_zero "${?}"

###################################################################################################

NAMESPACES="$(find . -type d -mindepth 1 -maxdepth 1 | cut -d '/' -f 2)" ; assert_zero "${?}"
for namespace in ${NAMESPACES}; do
  SECRETS="$(find ${namespace} -type f -mindepth 1 -maxdepth 1)" ; assert_zero "${?}"
  for secret in ${SECRETS}; do
    cat ${secret} | jq -r '.data."tls.crt"' | base64 --decode | openssl x509 -checkend 0 ; EXPIRED="${?}"
    if [ ${EXPIRED} -eq 1 ]; then
      rm -fv ${secret}
    else
      kubectl get secret --namespace=${namespace} $(echo ${secret} | cut -d '/' -f 2) ; CREATE="${?}"
      if [ ${CREATE} -eq 1 ]; then
        kubectl get namespace ${namespace} ; [[ ${?} -eq 1 ]] && kubectl create namespace ${namespace}
        kubectl create --namespace=${namespace} --filename=${secret} --validate=true
      fi
    fi
  done
done

###################################################################################################

find . -empty -type d -exec rm -rfv {} \;

###################################################################################################
