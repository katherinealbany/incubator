#!/bin/bash -x

###################################################################################################

helm delete --purge nginx-ingress

###################################################################################################

kubectl delete --wait=true namespace nginx-ingress

###################################################################################################

exit 0

###################################################################################################
