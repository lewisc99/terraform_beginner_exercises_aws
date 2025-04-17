provider "aws" {
  region = "us-east-1"
}


# First plan to create the resources
resource "aws_sqs_queue" "test_queue" {
  name                       = "test_queue"
  visibility_timeout_seconds = 30
}

