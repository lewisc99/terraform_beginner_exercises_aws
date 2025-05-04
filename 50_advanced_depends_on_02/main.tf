# Order - Terraform will create the resources in the order they are defined in the file.
# This is the default behavior, and it works well for most cases.
# However, if you have a more complex dependency graph, you can use the `depends_on` argument to explicitly define dependencies between resources.
# This is useful when you have resources that are not directly related but need to be created in a specific order.

resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-lewis-1083948922" # Create a unique bucket name
  acl    = "private" # ACL is basically deprecated, but still used in some cases
}

resource "aws_s3_bucket_object" "index" {
  bucket  = aws_s3_bucket.mybucket.id # This is the implicit dependency on the S3 bucket
  key     = "index.html"
  content = "<html><body>Hello, world!</body></html>"

  # This resource already has an implicit dependency on aws_s3_bucket.mybucket
  # because of the reference aws_s3_bucket.mybucket.id.
}

resource "local_file" "generate_logs" {
  # Imagine this runs a script that generates logs you want to upload - for windows users, you can use a batch file or PowerShell script
  filename = "logs.txt"
  content  = "Log entry at ${timestamp()}" # Adds a log entry with the current timestamp
}

# Logs will only be uploaded after the null_resource has completed
# This is an explicit dependency on the null_resource.generate_logs resource
# The null_resource is used to run a script that generates logs before uploading them to S3
resource "aws_s3_bucket_object" "logs" { 
  bucket = aws_s3_bucket.mybucket.id # This is the implicit dependency on the S3 bucket
  key    = "logs.txt"
  source = "logs.txt"

  # Force Terraform to wait for the log-generation step
  # depends_on in this case is used to ensure that the logs are generated before uploading them
  depends_on = [
    local_file.generate_logs 
  ] 
}