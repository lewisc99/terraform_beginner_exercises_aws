variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "max_receive_count" {
  description = "the maximum number of times that a message ca be received by consumers"
  default     = 5
}

variable "visibility_timeout" {
  default = 30
}
