provider "aws" {
  region = "us-east-2"
}

# This resource block creates an AWS SQS (Simple Queue Service) queue.
# The `aws_sqs_queue` resource is used to define and manage the queue.
# - `name`: Specifies the name of the SQS queue to be created.
resource "aws_sqs_queue" "my_queue" {
  name = "my-queue"
}

