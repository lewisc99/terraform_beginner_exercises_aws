# command to start terraform
terraform init

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# This command will destroy the resources created by terraform
teraform destroy -auto-approve

# this command will import an existing resource into terraform state
# it will not create the resource, but will add it to the state file
# this is useful when you have existing resources that you want to manage with terraform
# for example, if you have an existing VPC in AWS, you can import it like this
# terraform import <resource_type>.<resource_identifier> <value>
terraform import aws_vpc.example vpc-043f1a33bc4a4842b

# This command will destroy the resources created by terraform
teraform destroy -auto-approve