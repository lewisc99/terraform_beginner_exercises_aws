# This Terraform configuration creates an AWS S3 bucket using the AWS provider.
# 
# - The `provider "aws"` block specifies the AWS region where resources will be created (in this case, "us-east-1").
# 
# - The `variable "bucket_name"` block defines a variable to hold the name of the S3 bucket. 
#   - It has a default value of "lewis-example-bucket".
#   - The `description` explains the purpose of the variable.
# 
# - The `resource "aws_s3_bucket" "bucket_example"` block creates an S3 bucket.
#   - The bucket name is dynamically set using the value of the `bucket_name` variable.
# 
# This setup allows flexibility to change the bucket name by modifying the variable value without altering the resource block.

# variable "bucket_name" {
#   description = "The name of the S3 bucket you wish to create"
# }

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  type = string
  default = "lewis-example-bucket"
  description = "The name of the S3 bucket you wish to create"
}

resource "aws_s3_bucket" "bucket_example" {
  bucket = var.bucket_name
}