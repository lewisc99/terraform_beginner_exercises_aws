provider "aws" {
  region = "us-east-2"
}

variable "bucket_name" {
  default = "lewis"
  description = "The name of the S3 bucket you wish to create"
}

variable "bucket_suffix" {
  default = "-abcd"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}${var.bucket_suffix}"
}