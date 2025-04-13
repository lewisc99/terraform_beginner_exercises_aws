provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

# Create an S3 bucket policy to allow public access to the bucket
# will going to use the ID of the bucket created by the module
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = module.s3_bucket.bucket_id # Use the output from the module

  block_public_acls       = true # Block public ACLs, ACLs is a legacy way of granting access to S3 buckets and objects
  block_public_policy     = true # Block public bucket policies, bucket policies are the recommended way to manage access to S3 buckets and objects
  ignore_public_acls      = true # Ignore public ACLs, this is a legacy way of granting access to S3 buckets and objects
  restrict_public_buckets = true # Restrict public buckets, this is a legacy way of granting access to S3 buckets and objects,
  # public buckets are buckets that have public access granted through bucket policies or ACLs
  # and are not recommended for use in production environments
  # and should be avoided in favor of using IAM policies to manage access to S3 buckets and objects
}
