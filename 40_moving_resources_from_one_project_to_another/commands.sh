# command to start terraform
terraform init

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# This command will destroy the state file created by terraform
# But will not destroy the resources created by terraform
terraform state rm aws_vpc.my_vpc


# Project two 

terraform init


# This command will import an existing resource into terraform state,
# that contains in AWS, but not in the state file.
terraform import aws_vpc.main <VPC_ID>.

# will apply the changes to the state file
terraform apply


# Terraform state list will show the resources in the state file
terraform state list

# This command will destroy the resources created by terraform
terraform destroy -auto-approve


# Aditional commands - Moving resources between projects
terraform.exe state mv ^
  -state=terraform.tfstate ^
  -state-out=../project_one/terraform.tfstate ^
  aws_vpc.main ^
  aws_vpc.my_vpc

# to linux command line
terraform state mv \
  -state=terraform.tfstate \
  -state-out=../project_one/terraform.tfstate \
  aws_vpc.main \
  aws_vpc.my_vpc