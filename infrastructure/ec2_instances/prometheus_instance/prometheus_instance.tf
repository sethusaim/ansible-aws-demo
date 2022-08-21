provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "prometheus_instance" {
  ami                    = var.prometheus_ami
  instance_type          = var.prometheus_instance_type
  key_name               = var.prometheus_key_pair_name
  vpc_security_group_ids = [aws_security_group.prometheus_security_group.id]
  tags = {
    Name = var.prometheus_tag_name
  }

  root_block_device {
    volume_size = var.prometheus_volume_size
    volume_type = var.prometheus_volume_type
    encrypted   = var.prometheus_volume_encryption
  }

  connection {
    type    = var.prometheus_connection_type
    host    = self.public_ip
    user    = var.prometheus_connection_user
    timeout = var.prometheus_connection_timeout
  }
}
