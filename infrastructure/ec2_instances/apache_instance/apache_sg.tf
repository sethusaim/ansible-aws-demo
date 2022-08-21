resource "aws_security_group" "security_group" {
  name        = var.apache_sg_group_name

  ingress {
    from_port   = var.apache_ingress_from_port[0]
    to_port     = var.apache_ingress_to_port[0]
    protocol    = var.apache_protocol
    cidr_blocks = var.apache_cidr_block
  }

  ingress {
    from_port   = var.apache_ingress_from_port[1]
    to_port     = var.apache_ingress_to_port[1]
    protocol    = var.apache_protocol
    cidr_blocks = var.apache_cidr_block
  }

  ingress {
    from_port   = var.apache_ingress_from_port[2]
    to_port     = var.apache_ingress_to_port[2]
    protocol    = var.apache_protocol
    cidr_blocks = var.apache_cidr_block
  }

  egress {
    from_port   = var.apache_egress_from_port
    to_port     = var.apache_egress_to_port
    protocol    = var.apache_protocol
    cidr_blocks = var.apache_cidr_block
  }

  tags = {
    Name = var.apache_sg_group_name
  }
}
