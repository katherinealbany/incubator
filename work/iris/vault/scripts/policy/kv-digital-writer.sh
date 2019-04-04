#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-digital-writer -<<EOF
path "kv/data/digital" {
  capabilities = [ "create", "update", "delete" ]
}

path "kv/delete/digital" {
  capabilities = [ "create", "update" ]
}

path "kv/undelete/digital" {
  capabilities = [ "create", "update" ]
}

path "kv/destroy/digital" {
  capabilities = [ "create", "update" ]
}

path "kv/metadata/digital" {
  capabilities = [ "create", "update", "delete" ]
}
EOF

###################################################################################################