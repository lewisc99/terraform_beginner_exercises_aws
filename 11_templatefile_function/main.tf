# This Terraform configuration demonstrates the use of the `templatefile` function.
# 
# The `templatefile` function is used to render a template file by replacing placeholders
# with values provided in a map. In this example:
# 
# - The `templatefile` function reads the contents of the file `example.tpl`.
# - The placeholders in the template file are replaced with the values provided in the map:
#   - `name` is set to "kevin".
#   - `number` is set to 7.
# 
# The rendered template is stored in the `local.rendered` variable and is outputted
# using the `rendered_template` output block.
# 
# Ensure that the `example.tpl` file exists in the same directory as the Terraform configuration
# and contains placeholders that match the keys in the map (e.g., `${name}`, `${number}`).
locals {
  rendered = templatefile("./example.tpl", {name = "kevin" , number = 7})
}

output "rendered_template" {
  value = local.rendered
}