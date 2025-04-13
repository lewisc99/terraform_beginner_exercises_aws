resource "aws_sqs_queue" "sqs" {
  name                       = "awesome_co-${var.queue_name}"
  visibility_timeout_seconds = var.visibility_timeout # means the message will be invisible for 30 seconds after being received
  delay_seconds              = 0                      # means the message will be available immediately after being sent
  max_message_size           = 262144                 # 256 KB 
  message_retention_seconds  = 259200                 # 3 days
  receive_wait_time_seconds  = 20                     # long polling, means the queue will wait for 20 seconds for a message to arrive before returning an empty response
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_dead_letter.arn
    maxReceiveCount     = var.max_receive_count # means the message will be sent to the dead letter queue after being received 5 times
  })
  # means the message will be sent to the dead letter queue after being received 5 times
}

resource "aws_sqs_queue" "sqs_dead_letter" {
  name                      = "awesome_co-${var.queue_name}-dead-letter" # dead letter queue
  delay_seconds             = 0
  max_message_size          = 262144  # 256 KB
  message_retention_seconds = 1209600 # 14 days
  receive_wait_time_seconds = 20      # long polling, means the queue will wait for 20 seconds for a message to arrive before returning an empty response
}
