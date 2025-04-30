provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
}


# internet gateway is used to allow internet access to the VPC
# and the resources inside it
# it is a virtual router that connects the VPC to the internet
# in a easy way to understand it is like a door to the VPC
# and the resources inside it can go out to the internet and come back in
# it is a managed service by AWS and it is free to use
# it is a regional service and it is not available in all regions
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = aws_vpc.vpc.cidr_block
    map_public_ip_on_launch = true # this will assign a public IP to the instances in this subnet
    availability_zone = "us-east-1a"
}

# aws route table is used to control the routing of the traffic in the VPC
# it is a virtual router that connects the VPC to the internet and the resources inside it
# it is a managed service by AWS and it is free to use
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id # this will allow the instances in this subnet to access the internet
    }
}

# aws route table association is used to associate the route table with the subnet
# it is a managed service by AWS and it is free to use
# in this case we are associating the public route table with the public subnet
# this will allow the instances in this subnet to access the internet
resource "aws_route_table_association" "gateway_route" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}


# aws security group is used to control the inbound and outbound traffic of the instances in the VPC
# in this example below we are creating a security group that allows inbound traffic on port 22 (SSH) and port 80 (HTTP)
# and allows outbound traffic on all ports (0-65535) to all IPs (
resource "aws_security_group" "rules" {
    name = "example"
    vpc_id = aws_vpc.vpc.id

    # ingress is used to control the inbound traffic of the instances in the VPC
    # in this example below we are allowing inbound traffic on port 22 (SSH) and port 80 (HTTP)
    # inbound is the traffic that comes into the instance from the internet or other resources in the VPC
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.my_ip}/32"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # egress is used to control the outbound traffic of the instances in the VPC
    # in this example below we are allowing outbound traffic on all ports (0-65535)
    # outbound is the traffic that goes out of the instance to the internet or other resources in the VPC
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# aws key pair is used to create a key pair that will be used to access the instance
# it is a managed service by AWS and it is free to use

resource "aws_key_pair" "keypair" {
    key_name = "my_key"
    public_key = file("nginx_key.pub")
}


# aws ami - amazon machine image is used to create a virtual machine in the cloud
# it is a managed service by AWS and it is free to use
# it is a template that contains the operating system and the software that will be installed on the instance
data "aws_ami" "ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
    }
}


# aws instance - amazon ec2 instance is used to create a virtual machine in the cloud
# in a easy way to understand it is like a computer in the cloud that you can access and use

resource "aws_instance" "nginx" {
    ami = data.aws_ami.ami.image_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.rules.id]
    key_name = aws_key_pair.keypair.key_name
  

    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras enable nginx1.12",
            "sudo yum -y install nginx",
            "sudo chmod 777 /usr/share/nginx/html/index.html",
            "echo \"Hello from nginx on AWS\" > /usr/share/nginx/html/index.html",
            "sudo systemctl start nginx",
        ]
    }

    connection {
        host = aws_instance.nginx.public_ip
        type = "ssh"
        user = "ec2-user"
        private_key = file("nginx_key")
    }
}