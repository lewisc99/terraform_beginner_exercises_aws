# provider "aws" {
#   region = "us-east-1"
# }


# # First plan to create the resources
# resource "aws_sqs_queue" "test_queue" {
#     name = "test_queue"
#     visibility_timeout_seconds = 30
# }

# Second plan to update the resources
# resource "aws_sqs_queue" "test_queue" {
#     name = "test_queue"
#     visibility_timeout_seconds = 45
# }

# Third plan to update the resources
# resource "aws_sqs_queue" "test_queue" {
#     name = "my_queue"
#     visibility_timeout_seconds = 45
# }


# Fourth plan to destroy the resources
# basically removed all resources from the code
# and run terraform apply
