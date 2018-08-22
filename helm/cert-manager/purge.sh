###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

kubectl delete --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt-staging.yaml"
kubectl delete --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################

helm delete --purge cert-manager

###################################################################################################

kubectl delete --wait=true ns cert-manager

###################################################################################################
