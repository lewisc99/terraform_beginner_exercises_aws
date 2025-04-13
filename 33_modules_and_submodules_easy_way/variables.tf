variable "aws_region" {
  description = "AWS region for resource creation"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
  default     = "madruga-test-1234567890"
}
