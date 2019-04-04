#!/bin/bash -e
set -o pipefail

###################################################################################################

POLICIES='kv-digital-reader,kv-digital-writer,kv-digital-micro-services-reader,kv-digital-micro-services-writer'
MEMBER_ENTITY_NAMES='kirill.velikanov,sergey.evstifeev'

###################################################################################################

FIRST_ITERATION='true'
unset MEMBER_ENTITY_IDS
for ENTITY_NAME in $(echo "${MEMBER_ENTITY_NAMES}" | sed 's/,/ /g'); do
  ENTITY_ID=$(vault read -format=json identity/entity/name/${ENTITY_NAME} | jq -r '.data.id')
  if [ "${FIRST_ITERATION}" == 'true' ]; then
    MEMBER_ENTITY_IDS="${ENTITY_ID}"
    FIRST_ITERATION='false'
  else
    MEMBER_ENTITY_IDS="${MEMBER_ENTITY_IDS},${ENTITY_ID}"
  fi
done

###################################################################################################

vault write identity/group/name/digital-micro-services-writers policies="${POLICIES}" member_entity_ids="${MEMBER_ENTITY_IDS}"

###################################################################################################
