# Outputs the Amazon Resource Name (ARN) of the main SQS queue.
output "queue_arn" {
  value = aws_sqs_queue.sqs.arn
}

# Outputs the name of the main SQS queue.
output "queue_name" {
  value = aws_sqs_queue.sqs.name
}

# Outputs the Amazon Resource Name (ARN) of the dead-letter SQS queue.
output "dead_letter_queue_arn" {
  value = aws_sqs_queue.sqs_dead_letter.arn
}

# Outputs the name of the dead-letter SQS queue.
output "dead_letter_queue_name" {
  value = aws_sqs_queue.sqs_dead_letter.name
}