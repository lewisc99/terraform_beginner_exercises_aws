output "sub_message" {
  description = "Processed message from submodule1 (via its nested sub_submodule)"
  value       = module.sub_submodule.deep_message
}
