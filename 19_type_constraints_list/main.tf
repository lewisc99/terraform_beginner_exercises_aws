# This Terraform code demonstrates the use of type constraints, list manipulation, and output expressions.

# The variable "a" is defined as a list of strings with a default value of ["foo", "bar", "baz"].

# The following outputs are defined:
# 
# 1. Output "a":
#    - Outputs the entire list stored in the variable "a".
#    - Result: ["foo", "bar", "baz"]
#
# 2. Output "b":
#    - Uses the `element` function to retrieve the second element (index 1) from the list.
#    - Result: "bar"
#
# 3. Output "c":
#    - Uses the `length` function to calculate the number of elements in the list.
#    - Result: 3
#
# 4. Output "d":
#    - Uses the `join` function to concatenate all elements of the list into a single string, separated by ", ".
#    - Result: "foo, bar, baz"
#
# 5. Output "e":
#    - Uses a `for` expression to create a new list by iterating over each element in the list.
#    - This essentially creates a copy of the original list.
#    - Result: ["foo", "bar", "baz"]
#
# 6. Output "f":
#    - Uses a `for` expression with a condition to create a new list that excludes the element "bar".
#    - Result: ["foo", "baz"]
#
# 7. Output "g":
#    - Uses a `for` expression with a condition to exclude "bar" and then retrieves the first element of the resulting list.
#    - Result: "foo"

variable "a" {
  type = list(string)
  default = [ "foo", "bar", "baz" ]
}

output "a" {
  value = var.a
}

output "b" {
  value = element(var.a, 1)
}

output "c" {
  value = length(var.a)
}

output "d" {
  value = join(", ", var.a)
}

output "e" {
  value = [ for i in var.a : i ]
}

output "f" {
  value = [ for i in var.a : i if i != "bar" ]
}

output "g" {
  value = [ for i in var.a : i if i != "bar" ][0]
}
