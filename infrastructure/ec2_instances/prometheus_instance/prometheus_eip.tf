resource "aws_eip" "prometheus_elastic_ip" {
  vpc      = true
  instance = aws_instance.prometheus_instance.id
  tags = {
    Name = var.prometheus_eip_name
  }
}
