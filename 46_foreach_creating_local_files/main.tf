# This Terraform configuration demonstrates how to use the `for_each` meta-argument
# to create multiple local files based on a set of strings.
# Each file will be named after the fruit and will contain a simple message.
locals {
  fruits = toset(["apple", "banana", "cherry"])
}

resource "local_file" "fruit_files" {
  for_each = local.fruits # Using `for_each` to iterate over the set of fruits
  # Each fruit will create a separate local file, for_each in this case is a set of strings
  # is important to add for_each to the resource because it will create a resource for each element in the set

  filename = "${path.module}/${each.key}.txt" # Each file will be named after the fruit
  content  = "This is a file about ${each.key}." # Content of the file will include the fruit name
}
