# This Terraform configuration demonstrates the use of the `any` type constraint for variables.
# The `any` type allows variables to accept values of any type, providing flexibility in defining inputs.

# Variable `any_example`:
# - Type: `any`
# - Default Value: A map with two string fields (`field1` and `field2`).
# - Purpose: Demonstrates the use of the `any` type with a map as the default value.

# Variable `any_list_example`:
# - Type: `any`
# - Default Value: A list containing mixed types (integers, a string, and a boolean).
# - Purpose: Demonstrates the use of the `any` type with a list containing heterogeneous elements.

# Variable `any_map_example`:
# - Type: `any`
# - Default Value: A map with mixed value types (string, integer, and boolean).
# - Purpose: Demonstrates the use of the `any` type with a map containing heterogeneous values.

# Outputs:
# - `any_example`: Outputs the value of the `any_example` variable.
# - `any_list_example`: Outputs the value of the `any_list_example` variable.
# - `any_map_example`: Outputs the value of the `any_map_example` variable.

variable "any_example" {
    type = any
    default = {
        field1 = "foo"
        field2 = "bar"
    }
}

output "any_example" {
    value = var.any_example
}
variable "any_list_example" {
  type = any
  default = [1, 2, 3, "four", true]
}

variable "any_map_example" {
  type = any
  default = {
    key1 = "value1"
    key2 = 42
    key3 = false
  }
}

output "any_list_example" {
  value = var.any_list_example
}

output "any_map_example" {
  value = var.any_map_example
}
