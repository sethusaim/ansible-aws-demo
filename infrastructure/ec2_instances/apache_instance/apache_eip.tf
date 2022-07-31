resource "aws_eip" "elastic_ip" {
  vpc      = true
  instance = aws_instance.apache_instance.id
  tags = {
    Name = var.apache_eip_name
  }
}
