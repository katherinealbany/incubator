###################################################################################################

vault write auth/approle/login role_id=$(vault read -format=json auth/approle/role/gitlab-shared-engine-shared01-aws-travisperkins-cloud-digital-micro-services-product/role-id | jq -r '.data.role_id') secret_id=$(vault write -force -format=json auth/approle/role/gitlab-shared-engine-shared01-aws-travisperkins-cloud-digital-micro-services-product/secret-id | jq -r '.data.secret_id')

vault read aws/travis-perkins/digital/shared/creds/micro-services-metadata-editor

###################################################################################################
