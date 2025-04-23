# main.tf
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket
# This bucket will be used to store photos
resource "aws_s3_bucket" "photos" {
  bucket = "my-unique-photos-bucket-123"
}

# output the bucket name
# This output will be used to reference the bucket name in other parts of the code or in other modules
output "bucket_name" {
  value = aws_s3_bucket.photos.bucket
}
