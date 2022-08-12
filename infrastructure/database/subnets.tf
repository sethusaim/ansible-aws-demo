resource "aws_subnet" "subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_1_cidr
  availability_zone = var.az_1

  tags = {
    Name = var.db_subnet1_tag_name
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_2_cidr
  availability_zone = var.az_2

  tags = {
    Name = var.db_subnet2_tag_name
  }
}