#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

[[ -f "${BASE}/clean.sh" ]] && "${BASE}/clean.sh"

###################################################################################################

[[ -f "${BASE}/environment" ]] && source "${BASE}/environment"

###################################################################################################

[[ -z "${TEMPLATE_GLOB}" ]] && TEMPLATE_GLOB='*.tmpl'
TEMPLATES="$(find "${BASE}" -name "${TEMPLATE_GLOB}" -mindepth 1 -maxdepth 1 -print)"

###################################################################################################

for TEMPLATE in ${TEMPLATES}; do
  #################################################################################################
  #################################################################################################
  TEMPLATE_OUT="$(echo "${TEMPLATE}" | sed "s/${TEMPLATE_GLOB}//g")"
  yamllint --config-file "${BASE}/.yamllint" --strict ${TEMPLATE}
  gomplate --file "${TEMPLATE}" --out - | tee "${TEMPLATE_OUT}"
  yamllint --config-file "${BASE}/.yamllint" --strict ${TEMPLATE_OUT}
  #################################################################################################
  #################################################################################################
done

###################################################################################################

exit 0

###################################################################################################
