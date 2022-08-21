variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "prometheus_ami" {
  type    = string
  default = "ami-0c4f7023847b90238"
}

variable "prometheus_instance_type" {
  type    = string
  default = "t2.small"
}

variable "prometheus_key_pair_name" {
  type    = string
  default = "sethusaim"
}

variable "prometheus_tag_name" {
  type    = string
  default = "Prometheus Server"
}

variable "prometheus_eip_name" {
  type    = string
  default = "prometheus_elastic_ip"
}

variable "prometheus_sg_group_name" {
  type    = string
  default = "prometheus_sg_group"
}

variable "prometheus_ingress_from_port" {
  type    = list(number)
  default = [22, 9090, 9100]
}

variable "prometheus_ingress_to_port" {
  type    = list(number)
  default = [22, 9090, 9100]
}

variable "prometheus_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "prometheus_protocol" {
  type    = string
  default = "tcp"
}

variable "prometheus_egress_from_port" {
  type    = number
  default = 0
}

variable "prometheus_egress_to_port" {
  type    = number
  default = 65535
}

variable "prometheus_volume_size" {
  default = 30
  type    = number
}

variable "prometheus_volume_type" {
  default = "gp2"
  type    = string
}

variable "prometheus_volume_encryption" {
  default = true
  type    = bool
}

variable "prometheus_eip_vpc" {
  default = true
  type = bool
}

variable "prometheus_connection_type" {
  default = "ssh"
  type = string
}

variable "prometheus_connection_user" {
  default = "ubuntu"
  type = string
}

variable "prometheus_connection_timeout" {
  default = "4m"
  type = string
}
