#!/bin/bash -e
set -o pipefail

###################################################################################################

vault write identity/group name=digital-micro-services-writers policies=administrator member_entity_ids=$(vault read -format=json /identity/entity/name/katherine-albany | jq -r '.data.id')

###################################################################################################
