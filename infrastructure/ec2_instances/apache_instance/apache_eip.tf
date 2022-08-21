resource "aws_eip" "elastic_ip" {
  vpc      = var.apache_eip_vpc
  instance = aws_instance.apache_instance.id
  tags = {
    Name = var.apache_eip_name
  }
}
