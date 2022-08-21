resource "aws_eip" "elastic_ip" {
  vpc      = var.ansible_eip_vpc
  instance = aws_instance.ansible_instance.id
  tags = {
    Name = var.ansible_eip_name
  }
}
