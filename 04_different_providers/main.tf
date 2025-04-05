provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "ohio" # alias is used to differentiate between multiple providers
}

resource "aws_vpc" "n_virginia_vpc" {
  cidr_block = "10.0.0.0/16" # VPC in Virginia
}

resource "aws_vpc" "ohio_vpc" {
  cidr_block = "10.1.0.0/16" # VPC in Ohio, using the aliased provider
  provider   = aws.ohio # specify the provider to use for this resource
}


# explicity tell terraform to use the default provider for the resource
# resource "aws_vpc" "n_virginia_vpc" {
#     cidr_block = "10.0.0.0/16"
#     provider = "aws"
# }
