# command to start terraform
terraform init

# command to apply terraform and create resources on AWS
# This command will create the resources defined in the main.tf file
# It will prompt for confirmation before proceeding with the creation
# If you want to skip the confirmation prompt, you can use the -auto-approve flag
# terraform apply -auto-approve
# This command will create the resources defined in the main.tf file
# It will prompt for confirmation before proceeding with the creation
terraform plan

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# This command will destroy the resources created by terraform
teraform destroy -auto-approve
