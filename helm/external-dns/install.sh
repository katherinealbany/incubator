###################################################################################################

helm upgrade external-dns stable/external-dns --install --wait --namespace external-dns --version 0.7.0 --values "$(dirname ${BASH_SOURCE[0]})/values.yaml"

###################################################################################################
