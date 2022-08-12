resource "aws_vpc" "primary" {
  cidr_block           = var.primary_vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

resource "aws_internet_gateway" "primary" {
  vpc_id = aws_vpc.primary.id
}

resource "aws_route" "primary-internet_access" {
  route_table_id         = aws_vpc.primary.main_route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.primary.id
}