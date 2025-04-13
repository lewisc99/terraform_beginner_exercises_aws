# This block configures the AWS provider to interact with the AWS services.
# The "region" specifies the AWS region where resources will be created.
provider "aws" {
  region = "us-east-2"
}

# This block defines a module named "work_queue" that is sourced from the
# "./sqs_with_backoff" directory. The module is used to create an SQS queue
# with a backoff mechanism. The "queue_name" variable is passed to the module
# to name the queue as "work-queue".
module "work_queue" {
  source = "./sqs_with_backoff"
  queue_name = "work-queue"
}

# This output block exposes the name of the main SQS queue created by the module.
# It allows you to retrieve and display the queue name after the infrastructure
# is applied.
output "work_queue_name" {
  value = module.work_queue.queue_name
}

# This output block exposes the name of the dead-letter queue associated with
# the main SQS queue. The dead-letter queue is used to store messages that
# cannot be processed successfully.
output "work_queue_dead_letter_name" {
    value = module.work_queue.dead_letter_queue_name
}