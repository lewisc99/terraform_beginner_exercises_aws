
# security_group_2 inherits the security_group_1 variable, which is a common pattern in Terraform to avoid redundancy.
variable "security_group_1" {}
variable "security_group_2" {}
variable "port" {
  type = number
}

variable "protocol" {}
