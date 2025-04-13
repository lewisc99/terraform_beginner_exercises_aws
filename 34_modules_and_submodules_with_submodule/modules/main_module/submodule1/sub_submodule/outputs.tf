output "deep_message" {
  description = "Deep processed message from the sub_submodule"
  value       = "${var.common_message} - processed in sub_submodule"
}
