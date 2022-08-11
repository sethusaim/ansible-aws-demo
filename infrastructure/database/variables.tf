variable "region" {
  default = "us-east-1"
  type    = string
}

variable "db_ingress_from_port" {
  default = 0
  type    = number
}

variable "db_ingress_to_port" {
  default = 0
  type    = number
}

variable "db_ingress_protocol" {
  default = "-1"
  type    = string
}

variable "db_ingress_cidr_blocks" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}

variable "db_ingress_ipv6_cidr_blocks" {
  default = ["::/0"]
  type    = list(string)
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

variable "db_egress_ipv6_cidr_blocks" {
  default = ["::/0"]
  type    = list(string)
}

variable "db_sg_group_tag_name" {
  default = "mysql-security-group"
  type    = string
}

variable "allocated_storage" {
  default = 20
  type    = number
}

variable "engine" {
  default = "mysql"
  type    = string
}

variable "engine_version" {
  default = "8.0"
  type    = string
}

variable "mysql_db_name" {
  default = "mlflow_db"
  type    = string
}

variable "mysql_username" {
  default = "admin"
  type    = string
}
variable "mysql_password" {
  default = "mlflow123"
  type    = string
}

variable "instance_class" {
  default = "db.t2.micro"
  type    = string
}

variable "parameter_group_name" {
  default = "default.mysql8.0"
  type    = string
}

variable "skip_final_snapshot" {
  default = true
  type    = bool
}

variable "security_group_name" {
  default = "mlflow_db_sg_name"
  type    = string
}

variable "db_vpc_id" {
  default = "vpc-00d09b1de33a26216"  
  type    = string
}

variable "identifier" {
  default = "mlflow"
  type    = string
}

variable "publicly_accessible" {
  default = true
  type    = bool
}

