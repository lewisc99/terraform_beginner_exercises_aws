# Initialize the Terraform working directory.
terraform init

# Apply the Terraform configuration in the current workspace.
terraform apply

# List all available workspaces.
terraform workspace list
# Output: The current workspace is marked with an asterisk (*), e.g., * default.

# Create a new workspace named "dev".
terraform workspace new dev

# List all available workspaces again to confirm the new workspace.
terraform workspace list
# Output: The "dev" workspace is now listed and marked as the current workspace (* dev).

# Apply the Terraform configuration in the "dev" workspace.
terraform apply

# Switch back to the "default" workspace.
terraform workspace select default

# Apply the Terraform configuration in the "default" workspace.
terraform apply

# Switch back to the "dev" workspace.
terraform workspace select dev

# Destroy the infrastructure in the "dev" workspace.
terraform destroy

# Switch back to the "default" workspace.
terraform workspace select default

# Delete the "dev" workspace.
terraform workspace delete dev

# List all available workspaces to confirm deletion.
terraform workspace list

# Destroy the infrastructure in the "default" workspace.
terraform destroy


terraform workspace list

terraform destroy