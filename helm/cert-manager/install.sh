###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --wait --namespace cert-manager --version 0.4.1 --set "podDnsPolicy=None,podDnsConfig.nameservers={1.1.1.1,8.8.8.8}"

###################################################################################################

kubectl apply --record=true --wait=true --filename="$(dirname ${BASH_SOURCE[0]})/cluster-issuer-lets-encrypt.yaml"

###################################################################################################
