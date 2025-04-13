output "message_from_submodule1" {
  description = "Output from submodule1"
  value       = module.submodule1.sub_message
}

output "message_from_submodule2" {
  description = "Output from submodule2"
  value       = module.submodule2.sub_message
}
