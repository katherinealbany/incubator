#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################

[[ -n "${1}" ]] && cd "${1}"

###################################################################################################

BASE="$(dirname "${BASH_SOURCE[0]}")"

###################################################################################################

[[ -f ./environment ]] && source ./environment

###################################################################################################

[[ -z "${TEMPLATE_DELIMITER}"    ]] && TEMPLATE_DELIMITER='.'
[[ -z "${TEMPLATE_EXTENSION}"    ]] && TEMPLATE_EXTENSION='tmpl'
[[ -z "${YAML_LINT_CONFIG_FILE}" ]] && YAML_LINT_CONFIG_FILE='./.yamllint'

###################################################################################################

TEMPLATES="$(find . -name "*${TEMPLATE_DELIMITER}${TEMPLATE_EXTENSION}" -print)"

###################################################################################################

git clean -f -X .

###################################################################################################

# for INPUT_FILE in ${TEMPLATES}; do
#   #################################################################################################
#   #################################################################################################
#   OUTPUT_FILE="$(echo "${INPUT_FILE}" | sed "s/${TEMPLATE_DELIMITER}${TEMPLATE_EXTENSION}//g")"
#
#   gomplate --file "${INPUT_FILE}" --out - | tee "${OUTPUT_FILE}"
#
#   OUTPUT_EXTENSION="$(echo "${OUTPUT_FILE}" | rev | awk -F"${TEMPLATE_DELIMITER}" '{print $1}' | rev)"
#
#   case ${OUTPUT_EXTENSION} in
#     sh)
#       chmod -v u+x "${OUTPUT_FILE}"
#       ;;
#     yaml)
#       yamllint --config-file "${YAML_LINT_CONFIG_FILE}" --strict ${OUTPUT_FILE}
#       ;;
#   esac
#   #################################################################################################
#   #################################################################################################
# done

###################################################################################################

exit 0

###################################################################################################
