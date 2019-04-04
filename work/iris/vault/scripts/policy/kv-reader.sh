#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-reader -<<EOF
path "kv/data" {
  capabilities = [ "read" ]
}

path "kv/metadata" {
  capabilities = [ "read" ]
}

path "kv/metadata/" {
  capabilities = [ "list" ]
}
EOF

###################################################################################################
