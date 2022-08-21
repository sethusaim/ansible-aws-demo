resource "aws_eip" "elastic_ip" {
  vpc      = var.jenkins_eip_vpc
  instance = aws_instance.jenkins_instance.id
  tags = {
    Name = var.jenkins_eip_name
  }
}
