#!/bin/bash -x

###################################################################################################

helm delete --purge kibana

###################################################################################################

kubectl delete --wait=true namespace kibana

###################################################################################################

exit 0

###################################################################################################