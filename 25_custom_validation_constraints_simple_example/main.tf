// main.tf

// A simple variable for the deployment environment.
// This variable accepts only one of three allowed values: "dev", "test", or "prod".
variable "environment" {
  description = "The deployment environment: dev, test, or prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, or prod."
  }
}

// A simple variable for the maximum number of instances.
// This variable ensures that the number provided is between 1 and 5.
variable "max_instances" {
  description = "The maximum number of instances to launch (between 1 and 5)"
  type        = number
  default     = 1

  validation {
    condition     = var.max_instances >= 1 && var.max_instances <= 5
    error_message = "max_instances must be a number between 1 and 5."
  }
}

// Dummy resource block to demonstrate usage of the above variables.
resource "null_resource" "example" {
  triggers = {
    environment   = var.environment
    max_instances = var.max_instances
  }
}
