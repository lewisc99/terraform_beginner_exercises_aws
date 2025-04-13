resource "aws_instance" "this" {
  ami           = var.ami_id        # Example: "ami-0c55b159cbfafe1f0" (Amazon Linux 2 in us-east-1)
  instance_type = var.instance_type # Example: "t2.micro"

  
  tags = {
    Name    = "${var.project_name}-instance" # Tagging the instance with the project name
    Project = var.project_name               # Tagging the instance with the project name
  }
}


