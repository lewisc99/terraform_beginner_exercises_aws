variable "instance_map" {}
variable "environment_type"{}

output "selected_instance" {
  value = var.instance_map[var.environment_type]
  # The above line is equivalent to the following:
  # value = lookup(var.instance_map, var.environment_type)
  # This will return the value associated with the key in the map.
}