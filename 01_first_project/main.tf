# # Specifies the AWS provider to use for Terraform
# provider "aws" {
#   # Sets the AWS region where resources will be created
#   region = "us-east-1"  
# }

# # Defines an AWS S3 bucket resource
# resource "aws_s3_bucket" "first_bucket" {
#   # Specifies the name of the S3 bucket to be created
#   bucket = "<yourname>-first-bucket"
# }


# Specifies the AWS provider to use for Terraform
provider "aws" {
  # Sets the AWS region where resources will be created
  region = "us-east-1"  
}

# Defines an AWS S3 bucket resource
resource "aws_s3_bucket" "first_bucket" {
  # Specifies the name of the S3 bucket to be created
  bucket = "luiz-first-bucket"
}