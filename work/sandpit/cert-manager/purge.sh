#!/bin/bash -x

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

kubectl delete --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt-staging.yaml"
kubectl delete --wait=true --filename="${BASE}/cluster-issuer-lets-encrypt.yaml"

###################################################################################################

helm delete --purge cert-manager

###################################################################################################

kubectl delete --wait=true namespace cert-manager

###################################################################################################

for item in $(kubectl get crd --output=custom-columns=:.metadata.name | grep certmanager.k8s.io); do
  kubectl delete --wait=true crd ${item}
done

###################################################################################################

exit 0

###################################################################################################
