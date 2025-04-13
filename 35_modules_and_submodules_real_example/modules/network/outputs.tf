output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "The ID of the created subnet from the nested module"
  value       = module.subnet.subnet_id
}
