
resource "aws_subnet" "this" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block

  tags = {
    Name    = "${var.project_name}-subnet"
    Project = var.project_name
  }
}
