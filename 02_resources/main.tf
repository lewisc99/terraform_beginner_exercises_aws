# 01 - google_folder
# This file contains the main configuration for the Google Cloud resources.
# It includes the creation of a Google Cloud project, a folder, and a service account.
# It also includes the necessary IAM roles and permissions for the service account.
# It is important to note that the project and folder names should be unique within the organization.
# The project name should be in lowercase and can contain letters, numbers, and hyphens.
# The folder name should be in lowercase and can contain letters, numbers, and hyphens.
# The service account name should be in lowercase and can contain letters, numbers, and hyphens.

# resource "google_folder" "department" {
#     display_name = "Department"
#     parent = "organisation/1234567"
# }

# 02 -  postgresql database
# resource for postgresql database
#containing the database name, username, and password
# resource "postgresql_role" "my_role" {
#     name = "my_role"
#     login = true
#     password = "password123"
# }

# 03 - aws_security_group
# This file contains the main configuration for the AWS resources.
# It includes the creation of a security group and an EC2 instance.
# It also includes the necessary IAM roles and permissions for the EC2 instance.
# It is important to note that the security group name should be unique within the VPC.
# The security group name should be in lowercase and can contain letters, numbers, and hyphens. 
# resource "aws_security_group" "my_security_group" {
#   name = "allow_tls"
#   ingress {
#     protocol = "tcp"
#     from_port = 443 # Replace with your desired port range
#     to_port = 443 # Replace with your desired port range
#     cidr_blocks = ["10.0.0.0/16", "11.0.0.0/16"] # Replace with your CIDR blocks
#   }
# }


resource "aws_s3_bucket" "first_bucket" {
  bucket = "lewis-terraform-bucket"
  acl = "private" # Set the ACL for the bucket to private, 
  # ACL is a legacy way of managing access to S3 buckets. It is recommended to use IAM policies instead.
  # The bucket name must be globally unique across all AWS accounts and regions.
  
  versioning {
    enabled = true # Enable versioning for the bucket
    mfa_delete = false # Disable MFA delete for the bucket
  }
  
}
