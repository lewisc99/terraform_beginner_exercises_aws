provider "aws" {
  region = "us-east-2"
}

# This section demonstrates how to manually define AWS SQS queues using Terraform.
# Each `aws_sqs_queue` resource block represents a single SQS queue.
# To manually create queues, uncomment the desired resource blocks and customize their attributes as needed.
# For example:
# - Uncomment `resource "aws_sqs_queue" "queue0"` to create a queue named "queue-0".
# - Repeat the process for other queues like "queue-1", "queue-2", and "queue-3".
# After making changes, run `terraform init` (if not already initialized), followed by `terraform apply` to provision the resources.
# Note: Ensure that the queue names are unique within your AWS account and region.

# example 01 - Manually defining AWS SQS queues

# resource "aws_sqs_queue" "queue0" {
#   name = "queue-0"
# }

# resource "aws_sqs_queue" "queue1" {
#   name = "queue-1"
# }

# resource "aws_sqs_queue" "queue2" {
#   name = "queue-2"
# }

# resource "aws_sqs_queue" "queue3" {
#   name = "queue-3"
# }

# Example 02 - Using count to create multiple SQS queues
# This section demonstrates how to use the `count` parameter to create multiple SQS queues in a single resource block.
resource "aws_sqs_queue" "queues" {
    count = 4
    name = "queue-${count.index}"
}

output "queue-0-name" {
  value = aws_sqs_queue.queues[0].name
}
