provider "aws" {
    region = "us-east-2"
}

resource "aws_sqs_queue" "queue" {
    # Create a queue with a name based on the workspace, e.g., "dev-queue", "prod-queue"
    # This allows you to have different queues for different environments
    # without having to change the code.
    # The queue name will be prefixed with the workspace name.
    # For example, if the workspace is "dev", the queue name will be "dev-queue".
    name = "${terraform.workspace}-queue"
}
