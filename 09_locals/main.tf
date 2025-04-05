# This Terraform configuration defines an AWS provider with the region set to "us-east-1".
# It uses local values (locals) to create reusable variables:
# - `first_part` is set to "hello".
# - `second_part` combines `first_part` with "-world".
# - `bucket_name` extends `second_part` with "-how-are-today".
# These locals can be used to simplify and organize string concatenation.
provider "aws" {
  region = "us-east-1"
}

locals {
  first_part = "hello"
  second_part = "${local.first_part}-world"
  bucket_name  = "${local.second_part}-how-are-today"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name
}
