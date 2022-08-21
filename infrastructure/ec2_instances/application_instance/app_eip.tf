resource "aws_eip" "elastic_ip" {
  vpc      = var.application_eip_vpc
  instance = aws_instance.application_instance.id
  tags = {
    Name = var.application_eip_name
  }
}