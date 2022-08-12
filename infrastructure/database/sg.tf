resource "aws_security_group" "default" {
  name   = var.db_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_ingress_from_port
    to_port     = var.db_ingress_to_port
    protocol    = var.db_ingress_protocol
    cidr_blocks = [var.db_ingress_cidr_blocks]
  }

  egress {
    from_port   = var.db_egress_from_port
    to_port     = var.db_egress_to_port
    protocol    = var.db_egress_protocol
    cidr_blocks = var.db_egress_cidr_blocks
  }

  tags = {
    Name = var.sg_name
  }
}
