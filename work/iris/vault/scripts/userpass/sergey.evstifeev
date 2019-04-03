#!/bin/bash -e
set -o pipefail

###################################################################################################




# vault write auth/userpass/users/sergey.evstifeev password=XXXXX

NAME=sergey
SURNAME=evstifeev

vault write identity/entity name=sergey-evstifeev metadata=email=sergey.evstifeev@travisperkins.co.uk

vault write identity/entity-alias name=sergey.evstifeev canonical_id=$(vault read -format=json /identity/entity/name/sergey-evstifeev | jq -r '.data.id') mount_accessor=$(vault auth list -format=json | jq -r '.[] | select(.type == "userpass") | .accessor')

vault write identity/group name=administrators policies=administrator member_entity_ids=$(vault read -format=json /identity/entity/name/sergey-evstifeev | jq -r '.data.id')

###################################################################################################
