provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "apache_instance" {
  ami                    = var.apache_ami
  instance_type          = var.apache_instance_type
  key_name               = var.apache_key_pair_name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  tags = {
    Name = var.apache_tag_name
  }

  root_block_device {
    volume_size = var.apache_volume_size
    volume_type = var.apache_volume_type
    encrypted   = var.apache_volume_encryption
  }

  connection {
    type    = var.apache_connection_type
    host    = self.public_ip
    user    = var.apache_connection_user
    timeout = var.apache_connection_timeout
  }
}