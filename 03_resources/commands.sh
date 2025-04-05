# to initialize the terraform directory
terraform init

# command to apply terraform and create resources on AWS
terraform apply -auto-approve

# we execute this command again because we added new security group rules
terraform apply 

# command to destroy the resources created by terraform
terraform destroy -auto-approve