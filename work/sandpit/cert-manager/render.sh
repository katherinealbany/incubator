#!/bin/bash -ex
set -o pipefail

###################################################################################################

BASE="$(dirname ${BASH_SOURCE[0]})"

###################################################################################################

TEMPLATE_EXTENSION='.tmpl'

###################################################################################################

TEMPLATES="$(find "${BASE}" -name "*${TEMPLATE_EXTENSION}" -print)"

###################################################################################################

for TEMPLATE in "${TEMPLATES}"; do
  TEMPLATE_OUT="$(echo "${TEMPLATE}" | sed "s/${TEMPLATE_EXTENSION}//g")"

  yamllint --config-file "${BASE}/.yamllint" --strict ${TEMPLATE}

  gomplate --file "${TEMPLATE}" --out - | tee "${TEMPLATE_OUT}"

  yamllint --config-file "${BASE}/.yamllint" --strict ${TEMPLATE_OUT}
done

###################################################################################################
