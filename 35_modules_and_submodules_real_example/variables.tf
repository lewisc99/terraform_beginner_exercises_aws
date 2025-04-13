variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The project name used for tagging resources"
  type        = string
  default     = "myLewisProject"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # Example CIDR block; adjust as needed.
  # Note: Ensure this CIDR block does not overlap with existing VPCs in your account.
  #10.0.0.0/16 is a common choice for private networks, but you can choose any valid CIDR block.
  # Just make sure it doesn't conflict with other networks you might have.
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
  # 10.0.1.0/24 is a common choice for a subnet within the VPC CIDR block.
  # Adjust as needed based on your network design.
  # Ensure this subnet CIDR does not overlap with other subnets in the same VPC.
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
  # t2.micro is a common choice for low-cost instances, especially for testing and development.
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (update this according to your region)"
  type        = string
  default     = "ami-00a929b66ed6e0de6" # Example AMI ID; replace as needed.
  # This AMI ID is for Amazon Linux 2 in the us-east-1 region.

}
