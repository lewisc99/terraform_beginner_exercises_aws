# command to start terraform
terraform init

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# This command will destroy the state file created by terraform
terraform destroy -auto-approve
