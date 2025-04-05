provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  #  cidr is a range of IP addresses for the VPC, 
  #in a easy way to understand is a range of IP addresses for the VPC
}

resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id  #  security group is a virtual firewall for your VPC 
  # basically vpc_id = aws_vpc.my_vpc.id  #  means that the security group is associated with the VPC
  name   = "Example security group"  #  name of the security group
}

resource "aws_security_group_rule" "tls_in" {
  protocol = "tcp"  #  protocol is the type of communication (tcp, udp, icmp)
  security_group_id =  aws_security_group.my_security_group.id  #  security group id is the id of the security group
  from_port = 443  #  from port is the starting port of the range of ports to allow traffic on
  to_port = 443  #  to port is the ending port of the range of ports to allow traffic on
  type = "ingress"  #  ingress means incoming traffic, egress means outgoing traffic
  # so ingress means that the rule allows incoming traffic to the security group to the specified port
  # and egress means that the rule allows outgoing traffic from the security group to the specified port
  cidr_blocks = ["0.0.0.0/0"]  #  cidr blocks in a easy way to understand is a range of IP addresses that are allowed to access the security group
  # so in this case, it means that any IP address can access the security group on port 443
  # so this rule allows incoming traffic from any IP address to the security group on port 443
}

# This resource defines an inbound (ingress) security group rule for allowing HTTP traffic.
# - Port 80 is the default port for HTTP, which is used for serving web pages.
# - The rule allows traffic from any IP address (0.0.0.0/0) to access resources in the security group.
# - This is typically used to enable access to a web server (e.g., an EC2 instance running a web application).
# - To test this, you can deploy a web server (e.g., Apache or Nginx) on an EC2 instance within the security group 
#   and access it using `http://<instance-public-ip>:80` from your browser or tools like `curl`.
# This configuration assumes that the application is accessible via port 80 on the 
# 'instance-public-ip'. If you intend to access the application using a different 
# port, such as 9090, ensure that the security group associated with the instance 
# allows inbound traffic on port 9090. Additionally, update any references to the 
# port in your configuration or documentation to reflect the change.
# This security group rule allows inbound traffic to the instance 
# on a range of ports from 9090 to 9095. This is typically used 
# for connecting to a VPN or other services that require this port range.
# Ensure that the CIDR block or source security group is configured 
# appropriately to restrict access to trusted sources only.
resource "aws_security_group_rule" "http_in" {
    protocol = "tcp"
    security_group_id = aws_security_group.my_security_group.id
    from_port = 80
    to_port = 80
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
}
