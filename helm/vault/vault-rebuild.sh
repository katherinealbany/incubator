###################################################################################################

AWS_REGION=eu-west-2

###################################################################################################

helm delete --purge vault

###################################################################################################

helm install --debug --name vault --values vault-values.yaml --set "${1}" ccoe/vault

###################################################################################################