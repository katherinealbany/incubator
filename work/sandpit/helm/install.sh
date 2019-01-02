#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/service-account.yaml"
kubectl apply --record=true --wait=true --filename="${BASE}/cluster-role-binding.yaml"

###################################################################################################

helm init --upgrade --debug --wait --tiller-namespace kube-system --service-account tiller --history-max 10 --replicas 3

###################################################################################################
