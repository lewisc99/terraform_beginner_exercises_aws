output "message_from_submodule1" {
  description = "Message returned from submodule1 (and its nested sub_submodule)"
  value       = module.main_module.message_from_submodule1
}

output "message_from_submodule2" {
  description = "Message returned from submodule2"
  value       = module.main_module.message_from_submodule2
}
