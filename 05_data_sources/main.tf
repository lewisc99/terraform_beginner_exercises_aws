provider "aws" {
  region = "us-east-1"
}

# This data source retrieves information about an existing S3 bucket in AWS.
# The "aws_s3_bucket" data source allows you to access metadata about a specific S3 bucket
# by specifying its name using the "bucket" argument.
# This is useful when you need to reference properties of an existing bucket,
# such as its ARN, region, or other attributes, without creating a new bucket.

data "aws_s3_bucket" "bucket" {
  bucket = "lewis-bucket-already-exists"  
}

resource "aws_iam_policy" "my_bucket_policy" {
  name        = "my_bucket_policy"
  description = "My bucket policy for S3 bucket"
 
  # Documentation for the Terraform code block

  # The `policy` block defines an inline JSON policy document. This is often used to specify permissions for AWS resources.
  # The `<<EOF` and `EOF` syntax is known as a "Heredoc" in Terraform. It allows you to define a multi-line string, making it easier to write JSON or other structured data directly within your Terraform configuration.

  # Inside the policy document:
  # - `"Version": "2012-10-17"`: This specifies the version of the policy language. The date "2012-10-17" is the latest version and is required for most AWS services.
  # - `"Statement"`: This is an array of permission statements. Each statement defines a specific set of actions, resources, and conditions.

  # Within the `Statement` block:
  # - `"Action": ["s3:ListBucket"]`: This specifies the action that is being allowed. In this case, `s3:ListBucket` allows listing the contents of an S3 bucket.
  # - `"Effect": "Allow"`: This specifies whether the action is allowed or denied. Here, it is set to "Allow".
  # - `"Resource": ["${data.aws_s3_bucket.bucket.arn}"]`: This specifies the resource(s) to which the policy applies. 
  #   - `${data.aws_s3_bucket.bucket.arn}`: This is a reference to the ARN (Amazon Resource Name) of the S3 bucket. 
  #     - The ARN is a unique identifier for AWS resources, and it is required to specify which resource the policy applies to.
  #     - The `data.aws_s3_bucket.bucket` refers to a data source in Terraform that retrieves information about an existing S3 bucket. The `.arn` attribute extracts the ARN of that bucket.

  # In summary, this policy allows the `s3:ListBucket` action on the specific S3 bucket identified by its ARN. The use of `${data.aws_s3_bucket.bucket.arn}` ensures that the policy dynamically references the correct bucket, making the configuration reusable and adaptable.
  
  policy      = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": [
                  "s3:ListBucket"
              ],
              "Effect": "Allow",
              "Resource": [
                  "${data.aws_s3_bucket.bucket.arn}" 
              ]
          }
      ]
  }
  EOF
}