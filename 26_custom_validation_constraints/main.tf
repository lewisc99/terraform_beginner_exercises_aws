// main.tf

// Validate an email address using a regex pattern
variable "admin_email" {
  description = "Administrator email address"
  type        = string
  default     = "admin@example.com"

  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.admin_email))
    error_message = "The provided email address is not in a valid format."
  }
}

// Ensure a list of security groups is not empty
variable "security_groups" {
  description = "List of security group names. Must contain at least one security group."
  type        = list(string)
  default     = ["default"]

  validation {
    condition     = length(var.security_groups) > 0
    error_message = "At least one security group must be specified."
  }
}

// Define an object variable for instance configuration with custom validations
variable "instance_config" {
  description = "Instance configuration parameters including type, disk size, and monitoring status."
  type = object({
    instance_type     = string,
    disk_size         = number,
    enable_monitoring = bool
  })
  default = {
    instance_type     = "t2.micro",
    disk_size         = 8,
    enable_monitoring = false
  }

  validation {
    // Check that the disk size is within the acceptable range
    condition     = var.instance_config.disk_size >= 8 && var.instance_config.disk_size <= 64
    error_message = "The disk_size must be between 8 and 64 GiB."
  }
}

// Dummy resource to demonstrate usage of the variables
resource "null_resource" "example" {
  triggers = {
    admin_email     = var.admin_email
    security_groups = join(",", var.security_groups)
    instance_type   = var.instance_config.instance_type
    disk_size       = tostring(var.instance_config.disk_size)
    monitoring      = tostring(var.instance_config.enable_monitoring)
  }
}
