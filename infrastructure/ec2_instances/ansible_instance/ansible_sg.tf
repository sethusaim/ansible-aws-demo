resource "aws_security_group" "security_group" {
  name        = var.ansible_sg_group_name

  ingress {
    from_port   = var.ansible_ingress_from_port[0]
    to_port     = var.ansible_ingress_to_port[0]
    protocol    = var.ansible_protocol
    cidr_blocks = var.ansible_cidr_block
  }

  ingress {
    from_port   = var.ansible_ingress_from_port[1]
    to_port     = var.ansible_ingress_to_port[1]
    protocol    = var.ansible_protocol
    cidr_blocks = var.ansible_cidr_block
  }

  ingress {
    from_port   = var.ansible_ingress_from_port[2]
    to_port     = var.ansible_ingress_to_port[2]
    protocol    = var.ansible_protocol
    cidr_blocks = var.ansible_cidr_block
  }

  egress {
    from_port   = var.ansible_egress_from_port
    to_port     = var.ansible_egress_to_port
    protocol    = var.ansible_protocol
    cidr_blocks = var.ansible_cidr_block
  }

  tags = {
    Name = var.ansible_sg_group_name
  }
}
