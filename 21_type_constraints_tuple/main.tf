variable "my_tuple" {
  type = tuple([ number, string, bool ])
  default = [ 1, "hello", true ]
}

# Example of a tuple with different types
variable "another_tuple" {
  type = tuple([ string, number, bool ])
  default = [ "world", 42, false ]
}

# Example of a tuple with nested tuples
variable "nested_tuple" {
  type = tuple([ tuple([ string, number ]), bool ])
  default = [ [ "nested", 99 ], true ]
}

# This would throw an error because the types do not match the defined tuple type
# variable "invalid_tuple" {
#   type = tuple([ number, string, bool ])
#   default = [ "wrong_type", 123, "not_bool" ]
# }

output "tuple" {
  value = var.my_tuple
}

output "another_tuple" {
  value = var.another_tuple
}

# output "nested_tuple" {
#   value = var.nested_tuple
# }