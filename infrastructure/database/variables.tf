variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "db_sg_name" {
  default = "main_rds_sg"
  type    = string
}

variable "db_ingress_from_port" {
  default = 0
  type    = number
}

variable "db_ingress_to_port" {
  default = 65535
  type    = number
}

variable "db_ingress_protocol" {
  default = "TCP"
  type    = string
}

variable "db_egress_from_port" {
  default = 0
  type    = number
}

variable "db_egress_to_port" {
  default = 0
  type    = number
}

variable "db_egress_protocol" {
  default = "-1"
  type    = string
}

variable "db_egress_cidr_blocks" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}

variable "db_subnet1_tag_name" {
  default = "main_subnet1"
  type    = string
}

variable "db_subnet2_tag_name" {
  default = "main_subnet2"
  type    = string
}

variable "db_subnet_group_name" {
  default = "main_subnet_group"
  type    = string
}

variable "identifier" {
  default = "mydb-rds"
  type    = string
}

variable "storage" {
  default = "10"
  type    = string
}

variable "engine" {
  default = "postgres"
  type    = string
}

variable "engine_version" {
  default = {
    mysql    = "5.7.21"
    postgres = "9.6.8"
  }
}

variable "instance_class" {
  default = "db.t2.micro"
  type    = string
}

variable "db_name" {
  default = "mydb"
  type    = string
}

variable "username" {
  default = "myuser"
  type    = string
}

variable "password" {
  default = "password"
  type    = string
}

variable "db_ingress_cidr_blocks" {
  default = "0.0.0.0/0"
  type    = string
}

variable "sg_name" {
  default = "rds_sg"
  type    = string
}

variable "subnet_1_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "subnet_2_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "az_1" {
  default = "us-east-1b"
  type    = string
}

variable "az_2" {
  default = "us-east-1c"
  type    = string
}

variable "vpc_id" {
  default = "vpc-00d09b1de33a26216"
  type    = string
}
