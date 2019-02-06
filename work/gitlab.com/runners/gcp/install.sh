#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

BASE="$(dirname "${BASH_SOURCE[0]}")"

###################################################################################################

helm upgrade gitlab-runner-1 gitlab/gitlab-runner --install --debug --wait --namespace gitlab-runner --values "${BASE}/values.yaml"
helm upgrade gitlab-runner-2 gitlab/gitlab-runner --install --debug --wait --namespace gitlab-runner --values "${BASE}/values.yaml"
helm upgrade gitlab-runner-3 gitlab/gitlab-runner --install --debug --wait --namespace gitlab-runner --values "${BASE}/values.yaml"
helm upgrade gitlab-runner-4 gitlab/gitlab-runner --install --debug --wait --namespace gitlab-runner --values "${BASE}/values.yaml"

###################################################################################################
