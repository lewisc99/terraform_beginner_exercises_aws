provider "aws" {
  region  = "us-east-2"
}

resource "aws_sqs_queue" "queue" {
  name = "queue"
  # lifecycle {
  #   prevent_destroy = true
  # }
}