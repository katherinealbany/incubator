###################################################################################################

BASE=$(dirname ${BASH_SOURCE[0]})

###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --wait --namespace cert-manager --version 0.4.1 --values "${BASE}/values.yaml"

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################
