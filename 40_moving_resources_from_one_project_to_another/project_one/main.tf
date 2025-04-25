
provider "aws" {
    region = "us-east-2"
}


# # Create a VPC with a CIDR block of
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.1.0.0/16"

    tags = {
        Name = "vpc"
    }
}
