#!/bin/bash
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

helm delete --purge gitlab-runner

###################################################################################################

kubectl delete --wait=true namespace/gitlab.com

###################################################################################################

exit 0

###################################################################################################
