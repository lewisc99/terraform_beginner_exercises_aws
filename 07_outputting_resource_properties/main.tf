# This Terraform configuration defines an AWS provider and provisions an S3 bucket.
# It includes the following outputs:
#
# - `bucket_name`: Outputs the name (ID) of the S3 bucket.
#   Description: "The name of the S3 bucket".
#
# - `bucket_arn`: Outputs the Amazon Resource Name (ARN) of the S3 bucket.
#   Description: "The ARN of the S3 bucket".
#
# - `bucket_information`: Outputs a combined string containing both the bucket name (ID)
#   and the bucket ARN in a single output.
#   Description: "The name and ARN of the S3 bucket in a single output".

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "lewis-example-bucket"
}

output "bucket_name" {
  value       = aws_s3_bucket.first_bucket.id
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.first_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "bucket_information" {
  value = "bucket_name: ${aws_s3_bucket.first_bucket.id}, bucket_arn: ${aws_s3_bucket.first_bucket.arn}"
  description = "The name and ARN of the S3 bucket in a single output"
}