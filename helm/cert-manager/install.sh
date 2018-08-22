###################################################################################################

CERT_MANAGER_VERSION='0.4.1'

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --debug --wait --namespace cert-manager --version "${CERT_MANAGER_VERSION}" --set 'podDnsPolicy=None,podDnsConfig.nameservers={1.1.1.1,8.8.8.8}'

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt-staging.yaml"
kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################
