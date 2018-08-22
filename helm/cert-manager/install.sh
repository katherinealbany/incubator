###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --wait --namespace cert-manager --version 0.4.1 --set "podDnsPolicy=None,podDnsConfig.nameservers={1.1.1.1,8.8.8.8}"

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt-staging.yaml"
kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################
