###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

kubectl apply --record=true --wait=true --filename="${BASE}/service-account.yaml"
kubectl apply --record=true --wait=true --filename="${BASE}/cluster-role-binding.yaml"

###################################################################################################

helm init --upgrade --wait --tiller-namespace kube-system --service-account tiller --history-max 10 --replicas 1

###################################################################################################
