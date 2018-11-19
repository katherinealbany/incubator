#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -z "${EXTERNAL_DNS_VERSION}"                  ]] && EXTERNAL_DNS_VERSION='1.0.2'
[[ -z "${EXTERNAL_DNS_TXT_OWNER_ID_SALT}"        ]] && EXTERNAL_DNS_TXT_OWNER_ID_SALT='default'
[[ -z "${EXTERNAL_DNS_PUBLIC_ANNOTATION_FILTER}" ]] && EXTERNAL_DNS_PUBLIC_ANNOTATION_FILTER='external-dns/public=true'

###################################################################################################

helm upgrade external-dns-public  stable/external-dns --install --debug --wait --namespace external-dns --version "${EXTERNAL_DNS_VERSION}" --values "${BASE}/public-values.yaml"  --set txtOwnerId=external-dns-public-${EXTERNAL_DNS_TXT_OWNER_ID_SALT} --set "annotationFilter=${EXTERNAL_DNS_PUBLIC_ANNOTATION_FILTER}"
helm upgrade external-dns-private stable/external-dns --install --debug --wait --namespace external-dns --version "${EXTERNAL_DNS_VERSION}" --values "${BASE}/private-values.yaml" --set txtOwnerId=external-dns-private-${EXTERNAL_DNS_TXT_OWNER_ID_SALT}

###################################################################################################
