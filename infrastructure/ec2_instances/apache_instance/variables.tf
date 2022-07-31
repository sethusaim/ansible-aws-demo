variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "apache_ami" {
  type    = string
  default = "ami-0c4f7023847b90238"
}

variable "apache_instance_type" {
  type    = string
  default = "t2.small"
}

variable "apache_key_pair_name" {
  type    = string
  default = "sethusaim"
}

variable "apache_tag_name" {
  type    = string
  default = "Apache Server"
}

variable "apache_eip_name" {
  type    = string
  default = "apache_ip"
}

variable "apache_sg_group_name" {
  type    = string
  default = "apache_sg_group"
}

variable "apache_ingress_from_port" {
  type    = list(number)
  default = [22, 9090, 9100]
}

variable "apache_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "apache_protocol" {
  type    = string
  default = "tcp"
}

variable "apache_ingress_to_port" {
  type    = list(number)
  default = [22, 9090, 9100]
}

variable "apache_egress_from_port" {
  type    = number
  default = 0
}

variable "apache_egress_to_port" {
  type    = number
  default = 65535
}

variable "apache_volume_size" {
  default = 30
  type    = number
}

variable "apache_volume_type" {
  default = "gp2"
  type    = string
}

variable "apache_volume_encryption" {
  default = true
  type    = bool
}
