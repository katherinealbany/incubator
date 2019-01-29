#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

BASE="$(dirname "${BASH_SOURCE[0]}")"

###################################################################################################

helm upgrade gitlab gitlab/gitlab-runner --install --debug --wait --namespace gitlab --values "${BASE}/values.yaml"

###################################################################################################
