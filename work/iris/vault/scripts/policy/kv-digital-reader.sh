#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-digital-reader -<<EOF
path "kv/data/digital" {
  capabilities = [ "read" ]
}

path "kv/metadata/digital" {
  capabilities = [ "read" ]
}

path "kv/metadata/digital/" {
  capabilities = [ "list" ]
}
EOF

###################################################################################################