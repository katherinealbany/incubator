#!/bin/bash -e
set -o pipefail

###################################################################################################

vault policy write kv-digital-micro-services-reader -<<EOF
path "kv/data/digital/micro-services" {
  capabilities = [ "read" ]
}

path "kv/metadata/digital/micro-services" {
  capabilities = [ "read" ]
}

path "kv/metadata/digital/micro-services/" {
  capabilities = [ "list" ]
}
EOF

###################################################################################################
