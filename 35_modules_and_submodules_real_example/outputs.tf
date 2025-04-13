# Outputs to display information about the created resources
output "vpc_id" {
  description = "VPC ID from network module"
  value       = module.network.vpc_id
}

# Outputs to display information about the created resources
output "subnet_id" {
  description = "Subnet ID from network module"
  value       = module.network.subnet_id
}

# Outputs to display information about the created resources
output "instance_id" {
  description = "EC2 instance ID from compute module"
  value       = module.compute.instance_id
}
