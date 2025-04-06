# This Terraform configuration defines an AWS S3 bucket resource.
# 
# The `bucket_name` and `bucket_suffix` variables are used to construct the name of the S3 bucket.
# 
# The `bucket_name` variable is declared without a default value, meaning it must be provided 
# either directly in the configuration, through a `.tfvars` file (like `terraform.tfvars`), 
# or via command-line input. In your case, you have provided it in the `terraform.tfvars` file.
# 
# The `bucket_suffix` variable has a default value of "-abcd", but you have overridden it 
# in the `terraform.tfvars` file with the value "-from-file".
# 
# Declaring variables in the `main.tf` file is necessary because Terraform needs to know 
# which variables are expected and how they should be used. The `.tfvars` file is just one 
# way to provide values for these variables. Without declaring the variables in `main.tf`, 
# Terraform would not know that `bucket_name` and `bucket_suffix` are valid inputs or how 
# they should be used in the configuration.
# 
# In summary:
# - Variables are declared in `main.tf` to define their purpose and usage.
# - Values for these variables can be provided in a `.tfvars` file, environment variables, 
#   or directly in the CLI.
# - This separation allows for flexibility and reusability of the Terraform configuration.

provider "aws" {
  region = "us-east-2"
}

variable "bucket_name" {
    description = "the name of the bucket you wish to create"
}

variable "bucket_suffix" {
    default = "-abcd"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}${var.bucket_suffix}"
}