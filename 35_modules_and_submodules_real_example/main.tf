provider "aws" {
  region = var.aws_region
}

# Create a VPC and Subnet using the network module
module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  cidr_block   = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

# Create an EC2 instance using the compute module
# This module will create an EC2 instance in the subnet created by the network module
module "compute" {
  source        = "./modules/compute"
  project_name  = var.project_name
  instance_type = var.instance_type
  ami_id        = var.ami_id
}
