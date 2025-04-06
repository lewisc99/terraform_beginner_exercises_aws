
variable "my_map" {
    type = map(number)
    default = {
        "alpha" = 2
        "bravo" = 3
    }
}

output "map" {
    value = var.my_map
}

output "alpha_value" {
    value = var.my_map["alpha"]
}

# Example 1: A map of strings
variable "string_map" {
  type = map(string)
  default = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

output "string_map" {
  value = var.string_map
}

# Possible result:
# string_map = {
#   "key1" = "value1"
#   "key2" = "value2"
# }

# Example 2: A map of booleans
variable "boolean_map" {
  type = map(bool)
  default = {
    "feature_x_enabled" = true
    "feature_y_enabled" = false
  }
}

output "boolean_map" {
  value = var.boolean_map
}

# Possible result:
# boolean_map = {
#   "feature_x_enabled" = true
#   "feature_y_enabled" = false
# }

# Example 3: A map with an error (mismatched types)
# variable "error_map" {
#   type = map(number)
#   default = {
#     "key1" = 1
#     "key2" = "value2" # This will cause an error because "value2" is not a number
#   }
# }

# Error message:
# The default value for variable "error_map" is invalid: 
# element "key2": string required type "number".