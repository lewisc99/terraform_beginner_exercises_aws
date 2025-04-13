output "sub_message" {
  description = "Message directly returned from submodule2"
  value       = "${var.common_message} - processed by submodule2"
}
