# command to start terraform
terraform init

# ssh-keygen is used to generate a new SSH key, using the provided email as a label.
ssh-keygen

# will ask for a filename to save the key my example below
# Filename: nginx_key

# This command will create the resources defined in the main.tf file
# it will approve the changes automatically without prompting for confirmation
terraform apply -auto-approve

# add the my_ip for the input from the output.tf
# example:
# enter a value: 172.55.181.83

# This command will destroy the state file created by terraform
terraform destroy -auto-approve


# add the my_ip for the input from the output.tf
# example:
# enter a value: 172.55.181.83