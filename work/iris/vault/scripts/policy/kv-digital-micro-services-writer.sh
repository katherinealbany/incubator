#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-digital-micro-services-writer -<<EOF
path "kv/data/digital/micro-services" {
  capabilities = [ "create", "update", "delete" ]
}

path "kv/delete/digital/micro-services" {
  capabilities = [ "create", "update" ]
}

path "kv/undelete/digital/micro-services" {
  capabilities = [ "create", "update" ]
}

path "kv/destroy/digital/micro-services" {
  capabilities = [ "create", "update" ]
}

path "kv/metadata/digital/micro-services" {
  capabilities = [ "create", "update", "delete" ]
}
EOF

###################################################################################################