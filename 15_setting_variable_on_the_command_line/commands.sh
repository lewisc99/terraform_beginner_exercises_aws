# command to start terraform
terraform init

# This script executes the `terraform apply` command with specific variable values passed via the `-var` flag.
# - `bucket_name`: Specifies the name of the S3 bucket to be created or managed.
# - `bucket_suffix`: Adds a suffix to the bucket name for differentiation or organization purposes.
# Usage:
# Run this script to apply the Terraform configuration with the provided variable values.
terraform apply -var bucket_name=kevholditch -var bucket_suffix=foo


# command to destroy terraform and delete resources on AWS
terraform destroy