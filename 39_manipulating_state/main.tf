provider "aws" {
  region  = "us-east-2"
  version = "~> 2.27"
}

# Create a VPC with a CIDR block of
# CIDR in a VPC is a range of IP addresses, that can be used to create subnets
# and assign them to resources like EC2 instances, RDS databases, etc.
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example",
  }
}

