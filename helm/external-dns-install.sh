###################################################################################################

helm upgrade --install --debug --wait external-dns stable/external-dns --version 0.7.0 --namespace kube-system

###################################################################################################
