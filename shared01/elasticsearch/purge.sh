#!/bin/bash -x

###################################################################################################

helm delete --purge elasticsearch

###################################################################################################

kubectl delete --namespace elasticsearch pvc/state-elasticsearch-elasticsearch-data-0
kubectl delete --namespace elasticsearch pvc/state-elasticsearch-elasticsearch-data-1
kubectl delete --namespace elasticsearch pvc/state-elasticsearch-elasticsearch-data-2

###################################################################################################

kubectl delete --wait=true namespace elasticsearch

###################################################################################################

exit 0

###################################################################################################
