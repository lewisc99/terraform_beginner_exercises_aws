
# This file is used to define the output variables for the SQS module.
# It returns the SQS queue and the dead letter queue as outputs.
output "queue" {
    value = aws_sqs_queue.sqs
}

# The dead letter queue is used to store messages that could not be processed successfully.
# It is used to prevent messages from being lost and allows for later analysis of the failed messages.
output "dead_letter_queue" {
    value = aws_sqs_queue.sqs_dead_letter
}
