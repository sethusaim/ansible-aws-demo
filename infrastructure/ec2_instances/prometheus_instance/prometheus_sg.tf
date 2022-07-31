resource "aws_security_group" "prometheus_security_group" {
  name        = var.prometheus_sg_group_name
  description = "Security Group for Prometheus Server"

  ingress {
    from_port   = var.prometheus_ingress_from_port[0]
    to_port     = var.prometheus_ingress_to_port[0]
    protocol    = var.prometheus_protocol
    cidr_blocks = var.prometheus_cidr_block
  }

  ingress {
    from_port   = var.prometheus_ingress_from_port[1]
    to_port     = var.prometheus_ingress_to_port[1]
    protocol    = var.prometheus_protocol
    cidr_blocks = var.prometheus_cidr_block
  }

  ingress {
    from_port   = var.prometheus_ingress_from_port[2]
    to_port     = var.prometheus_ingress_to_port[2]
    protocol    = var.prometheus_protocol
    cidr_blocks = var.prometheus_cidr_block
  }

  egress {
    from_port   = var.prometheus_egress_from_port
    to_port     = var.prometheus_egress_to_port
    protocol    = var.prometheus_protocol
    cidr_blocks = var.prometheus_cidr_block
  }

  tags = {
    Name = var.prometheus_sg_group_name
  }
}