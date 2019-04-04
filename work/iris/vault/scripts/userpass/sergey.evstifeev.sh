#!/bin/bash -e
set -o pipefail

###################################################################################################

USERNAME='sergey.evstifeev'
EMAIL_ADDRESS="${USERNAME}@travisperkins.co.uk"

###################################################################################################

vault write identity/entity name=${USERNAME} metadata=email=${EMAIL_ADDRESS}

###################################################################################################

if [ $(vault read /auth/userpass/users/${USERNAME} > /dev/null 2>&1 ; echo ${?}) -ne 0 ]; then
  vault write identity/entity-alias name=${USERNAME} canonical_id=$(vault read -format=json /identity/entity/name/${USERNAME} | jq -r '.data.id') mount_accessor=$(vault auth list -format=json | jq -r '.[] | select(.type == "userpass") | .accessor')
  PASSWORD=$(vault write -format=json /sys/tools/random bytes=5 format=hex | jq -r '.data.random_bytes')
  vault write auth/userpass/users/${USERNAME} password=${PASSWORD}
  echo "Initial Random Password [${PASSWORD}]"
fi

###################################################################################################
