resource "aws_security_group" "security_group" {
  name        = var.apache_sg_group_name
  description = "Security Group for EKS Master Server"

  ingress {
    from_port   = var.apache_ingress_from_port
    to_port     = var.apache_ingress_to_port
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
