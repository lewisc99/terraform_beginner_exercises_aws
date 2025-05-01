provider "aws" {
  region  = "us-east-2"
}

# This example demonstrates how to use the `for_each` argument with a set of strings.
# The `for_each` argument is used to create multiple resources based on the items in the set.
# In this case, we are creating an SQS queue for each fruit in the set.
# The `toset` function is used to convert the list of fruits into a set, which is required for the `for_each` argument.
# The `for_each` argument is used to iterate over the set of fruits, and for each fruit, an SQS queue is created with a name based on the fruit.
# The `each.key` is used to access the current item in the iteration, which is the fruit name.
locals {
  fruit = toset(["apple", "orange", "banana"])
}

resource "aws_sqs_queue" "queues" {
    for_each = local.fruit # Using `for_each` to create multiple SQS queues based on the set of fruits
    name = "queue-${each.key}" # Using `each.key` to access the current item in the iteration
    # The name of the queue is set to "queue-" followed by the fruit name
    # For example, the queue name for "apple" will be "queue-apple"
}

output "queue-apple-name" {
  value = aws_sqs_queue.queues["apple"].name # Output the name of the SQS queue for "apple"
  # example output: queue-apple
}
