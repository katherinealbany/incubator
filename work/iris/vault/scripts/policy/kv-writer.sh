#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-writer -<<EOF
path "kv/data" {
  capabilities = [ "create", "update", "delete" ]
}

path "kv/delete" {
  capabilities = [ "create", "update" ]
}

path "kv/undelete" {
  capabilities = [ "create", "update" ]
}

path "kv/destroy" {
  capabilities = [ "create", "update" ]
}

path "kv/metadata" {
  capabilities = [ "create", "update", "delete" ]
}
EOF

###################################################################################################
