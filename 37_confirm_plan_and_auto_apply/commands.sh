# command to start terraform
terraform init

# This command will show the changes that will be made to the infrastructure
# it will not make any changes to the infrastructure
# it will show the changes in a human-readable format
terraform plan

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# This command will destroy the resources created by terraform
teraform destroy -auto-approve
