provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "target_instance" {
  ami                    = var.target_ami
  instance_type          = var.target_instance_type
  key_name               = var.target_key_pair_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  tags = {
    Name = var.target_tag_name
  }

  root_block_device {
    volume_size = var.target_volume_size
    volume_type = var.target_volume_type
    encrypted   = var.target_volume_encryption
  }

  connection {
    type    = "ssh"
    host    = self.public_ip
    user    = "ubuntu"
    timeout = "4m"
  }
}

resource "aws_security_group" "security_group" {
  name        = var.target_sg_group_name
  description = "Security Group for EKS Master Server"

  ingress {
    from_port   = var.target_ingress_from_port[0]
    to_port     = var.target_ingress_to_port[0]
    protocol    = var.target_protocol
    cidr_blocks = var.target_cidr_block
  }

  ingress {
    from_port   = var.target_ingress_from_port[1]
    to_port     = var.target_ingress_to_port[1]
    protocol    = var.target_protocol
    cidr_blocks = var.target_cidr_block
  }

  egress {
    from_port   = var.target_egress_from_port
    to_port     = var.target_egress_to_port
    protocol    = var.target_protocol
    cidr_blocks = var.target_cidr_block
  }

  tags = {
    Name = var.target_sg_group_name
  }
}

resource "aws_eip" "elastic_ip" {
  vpc      = true
  instance = aws_instance.target_instance.id
  tags = {
    Name = var.target_eip_name
  }
}
