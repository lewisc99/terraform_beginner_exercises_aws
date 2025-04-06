# Define a variable "my_set" with a type constraint of "set(number)".
# This means it can only contain unique numbers. The default value is [7, 2, 2],
# but since it's a set, duplicate values will be removed automatically.
variable "my_set" {
  type = set(number)
  default = [7, 2, 2]
}

# Define a variable "my_list" with a type constraint of "list(number)".
# This means it should contain a list of numbers. However, the default value
# provided ["foo", "bar", "foo"] contains strings, which will cause a type mismatch error.
variable "my_list" {
  type = list(string)
  default = ["foo", "bar", "foo"]
}

# Output the value of the "my_set" variable.
# This will display the unique numbers from the set.
output "set" {
  value = var.my_set
}

# Output the value of the "my_list" variable.
# This will display the list as defined, but since the type is incorrect,
# this will not work unless the default value is fixed.
output "list" {
  value = var.my_list
}

# Convert the "my_list" variable into a set using the "toset" function.
# This will remove duplicates and display unique values from the list.
output "list_as_set" {
  value = toset(var.my_list)
}

# Convert the "my_set" variable into a list using the "tolist" function.
# This will display the set as an ordered list.
output "set_as_list" {
  value = tolist(var.my_set)
}

