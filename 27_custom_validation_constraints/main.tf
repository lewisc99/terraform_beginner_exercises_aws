// main.tf

// Define a variable with custom validation to restrict allowed AWS regions
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
  
  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1"], var.region)
    error_message = "The region must be one of: us-east-1, us-west-2, or eu-west-1."
  }
}

// Define a variable with custom validation to ensure the instance count is within a valid range
variable "instance_count" {
  description = "Number of instances to launch (must be between 1 and 10)"
  type        = number
  default     = 1
  
  validation {
    condition     = var.instance_count > 0 && var.instance_count <= 10
    error_message = "The instance_count must be a number between 1 and 10."
  }
}

// Example resource to demonstrate usage of the variables (this can be any resource block)
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"  // Example AMI, replace with one valid in your region
  instance_type = "t2.micro"
  availability_zone = "${var.region}a"
  
  tags = {
    Name = "ExampleInstance-${count.index + 1}"
  }
}
