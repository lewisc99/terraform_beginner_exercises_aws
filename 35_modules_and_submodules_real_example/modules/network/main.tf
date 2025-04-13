# to create a VPC with a public and private subnet, an internet gateway, and a NAT gateway.

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name    = "${var.project_name}-vpc"
    project = var.project_name
  }
}

module "subnet" {
  source = "./subnet"

  vpc_id       = aws_vpc.this.id
  cidr_block   = var.subnet_cidr
  project_name = var.project_name
}
