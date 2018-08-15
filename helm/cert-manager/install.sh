###################################################################################################

helm upgrade cert-manager stable/cert-manager --install --debug --wait --namespace cert-manager --version 0.4.1 --values "$(dirname ${BASH_SOURCE[0]})/values.yaml"

###################################################################################################
