resource "aws_security_group_rule" "first_egress" {
  from_port                = var.port             # range of ports to open for egress traffic
  to_port                  = var.port             # this is the port that will be opened for egress traffic
  protocol                 = var.protocol         # protocol to use for egress traffic. e.g., tcp, udp
  security_group_id        = var.security_group_1 # ID of the security group to which the rule will be applied
  type                     = "egress"             # means that this rule is for egress traffic, egress is outbound traffic, outbound is traffic that is leaving the instance
  source_security_group_id = var.security_group_2 # source security group ID for the egress rule. This means that the traffic is allowed to leave the instance and go to the source security group

  # the difference between security_group_id and source_security_group_id is that security_group_id is the security group to which the rule will be applied, and source_security_group_id is the security group from which the traffic is allowed to leave
  # the instance and go to the source security group. In this case, the traffic is allowed to leave the instance and go to the source security group.
}

resource "aws_security_group_rule" "first_ingress" {
  from_port                = var.port
  to_port                  = var.port
  protocol                 = var.protocol
  security_group_id        = var.security_group_1
  type                     = "ingress" # ingress is inbound traffic, inbound is traffic that is coming into the instance
  source_security_group_id = var.security_group_2
  
}


resource "aws_security_group_rule" "second_egress" {
  from_port                = var.port
  to_port                  = var.port
  protocol                 = var.protocol
  security_group_id        = var.security_group_2
  type                     = "egress"
  source_security_group_id = var.security_group_1
}

resource "aws_security_group_rule" "second_ingress" {
  from_port                = var.port
  to_port                  = var.port
  protocol                 = var.protocol
  security_group_id        = var.security_group_2
  type                     = "ingress"
  source_security_group_id = var.security_group_1
}
