variable "vpc_id" {
  description = "The VPC ID in which to create the subnet"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "project_name" {
  description = "The project name for tagging"
  type        = string
}
