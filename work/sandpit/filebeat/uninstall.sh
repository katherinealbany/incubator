#!/bin/bash -x

###################################################################################################

helm delete --purge filebeat

###################################################################################################

kubectl delete --wait=true namespace filebeat

###################################################################################################

exit 0

###################################################################################################
