#!/bin/bash -e
set -o pipefail
[[ -n "${DEBUG}" ]] && set -x

###################################################################################################
# Version 1.0.0                                                                                   #
###################################################################################################

[[ -n "${1}" ]] && cd "${1}"

###################################################################################################

[[ -z "${DATASOURCE}"      ]] && DATASOURCE='/dev/null'
[[ -z "${DATASOURCE_NAME}" ]] && DATASOURCE_NAME='data'

###################################################################################################

[[ -z "${TEMPLATE_DELIMITER}" ]] && TEMPLATE_DELIMITER='.'
[[ -z "${TEMPLATE_EXTENSION}" ]] && TEMPLATE_EXTENSION='tmpl'

###################################################################################################

[[ -z "${YAML_EXTENSION}"        ]] && YAML_EXTENSION='yaml'
[[ -z "${YAML_LINT_CONFIG_FILE}" ]] && YAML_LINT_CONFIG_FILE='.yamllint'

###################################################################################################

git clean -f -X .

###################################################################################################

TEMPLATES="$(find . -name "*${TEMPLATE_DELIMITER}${TEMPLATE_EXTENSION}" -print)"

###################################################################################################

for INPUT_PATH in ${TEMPLATES}; do

  #################################################################################################

  [[ -f ./environment ]] && source ./environment

  #################################################################################################

  INPUT_BASE="$(dirname "${INPUT_PATH}")"
  [[ -f "${INPUT_BASE}/environment" ]] && source "${INPUT_BASE}/environment"

  #################################################################################################

  OUTPUT_PATH="$(echo "${INPUT_PATH}" | sed "s/${TEMPLATE_DELIMITER}${TEMPLATE_EXTENSION}//g")"
  gomplate --datasource "${DATASOURCE_NAME}=${DATASOURCE}" --file "${INPUT_PATH}" --out - | tee "${OUTPUT_PATH}"
  chmod u=rx,go= "${OUTPUT_PATH}"

  #################################################################################################

  case "$(echo "${OUTPUT_PATH}" | rev | awk -F"${TEMPLATE_DELIMITER}" '{print $1}' | rev)" in
    "${YAML_EXTENSION}")
      if [[ -f "${INPUT_BASE}/${YAML_LINT_CONFIG_FILE}" ]]; then
        yamllint --config-file "${INPUT_BASE}/${YAML_LINT_CONFIG_FILE}" --strict ${OUTPUT_PATH}
      elif [[ -f "./${YAML_LINT_CONFIG_FILE}" ]]; then
        yamllint --config-file "./${YAML_LINT_CONFIG_FILE}" --strict ${OUTPUT_PATH}
      else
        yamllint --strict ${OUTPUT_PATH}
      fi
      ;;
  esac

  #################################################################################################

done

###################################################################################################

exit 0

###################################################################################################
