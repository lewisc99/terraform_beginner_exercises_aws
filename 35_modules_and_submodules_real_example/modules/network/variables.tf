variable "project_name" {
  description = "The project name for tagging"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC" # CIDR is a notation for IP addresses and routing
  # CIDR block is a range of IP addresses in the VPC, basically CIDR is a way to define a range of IP addresses
  type = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet" # subnet_cidr is a range of IP addresses in the subnet, basically CIDR is a way to define a range of IP addresses,
  # that is a subset of the CIDR block for the VPC
  type = string
}
