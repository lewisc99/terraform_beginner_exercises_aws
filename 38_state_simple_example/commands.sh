# command to start terraform
terraform init

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# terraform plan -refresh=false, is used to show the changes that will be made to the infrastructure
# without actually applying them. The -refresh=false flag tells Terraform not to refresh the state file before planning.
# This is useful when you want to see what changes would be made without actually applying them.
terraform plan -refresh=false

# terraform destroy -auto-approve, is used to destroy the resources created by Terraform.
terraform destroy -auto-approve