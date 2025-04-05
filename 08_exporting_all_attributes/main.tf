provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "lewis-example-bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.first_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.first_bucket.arn
}

output "bucket_information" {
  value = "bucket name: ${aws_s3_bucket.first_bucket.id}, bucket arn: ${aws_s3_bucket.first_bucket.arn}"
}
# This output block exports all attributes of the S3 bucket resource "aws_s3_bucket.first_bucket".
# The "value" field references the entire resource, allowing access to all its attributes.
# The "description" field provides a brief explanation of the output's purpose.

output "bucket_all_attributes" {
  value = aws_s3_bucket.first_bucket
  description = "All attributes of the S3 bucket"
}