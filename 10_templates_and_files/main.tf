# This block defines the AWS provider configuration.
# The "aws" provider is used to interact with AWS services.
# The "region" specifies the AWS region where resources will be created (e.g., "us-east-1").

# This block creates an AWS IAM policy resource.
# The "aws_iam_policy" resource is used to define a custom IAM policy.
# The "name" attribute specifies the name of the IAM policy ("my_bucket_policy").
# The "description" provides a brief explanation of the policy's purpose.
# The "policy" attribute uses the "file" function to load the policy document from an external file.
# The file path provided ("/10_templates_and_files/policy.iam") points to the policy document.

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_policy" "my_bucket_policy" {
  name        = "my_bucket_policy"
  description = "My bucket policy for S3 bucket"
  policy      = file("/10_templates_and_files/policy.iam")
}


# The commented-out block below is an alternative IAM policy definition.
# It uses a different file for the policy document ("/10_templates_and_files/policy.json").
# Additionally, it includes a "tags" attribute to add metadata to the IAM policy.
# The tags include "Environment" (set to "dev"), "Project" (set to "Terraform"), and "Owner" (set to "John Doe").
# resource "aws_iam_policy" "my_bucket_policy" {
#   name        = "my_bucket_policy"
#   description = "My bucket policy for S3 bucket"
#   policy      = file("/10_templates_and_files/policy.json")

#   tags = {
#     Environment = "dev"
#     Project     = "Terraform"
#     Owner       = "John Doe"
#   }
# }
