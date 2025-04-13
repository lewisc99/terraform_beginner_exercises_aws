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
  source     = "./sqs_with_backoff"
  queue_name = "work-queue"
}


# This output block exposes all properties of the SQS queue created by the
# module. The "queue" output from the module is used to retrieve the queue

output "work_queue_name" {
  value = module.work_queue.queue
}

# This output block exposes the dead letter queue created by the module.
# with all its properties. The "dead_letter_queue" output from the module
output "work_queue_dead_letter_name" {
  value = module.work_queue.dead_letter_queue
}
