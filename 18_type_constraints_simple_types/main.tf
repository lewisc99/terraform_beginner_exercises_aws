variable "a" {
  type = string
  default = "hello"
}

variable "b" {
  type = bool 
  default = true
}

variable "c" {
  type = number
  default = 123
}

output "a" {
  value = var.a
}

output "b" {
  value = var.b
}

output "c" {
  value = var.c
}