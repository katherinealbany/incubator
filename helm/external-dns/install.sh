###################################################################################################

EXTERNAL_DNS_VERSION='0.7.4'

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

helm upgrade external-dns-public  stable/external-dns --install --debug --wait --namespace external-dns --version "${EXTERNAL_DNS_VERSION}" --values "${BASE}/public-values.yaml"
helm upgrade external-dns-private stable/external-dns --install --debug --wait --namespace external-dns --version "${EXTERNAL_DNS_VERSION}" --values "${BASE}/private-values.yaml"

###################################################################################################
