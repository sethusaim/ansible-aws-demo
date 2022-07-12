variable "aws_region" {
  type    = string
  default = "us-east-1"

}

variable "target_ami" {
  type    = string
  default = "ami-0c4f7023847b90238"
}

variable "target_instance_type" {
  type    = string
  default = "t2.micro"

}

variable "target_key_pair_name" {
  type    = string
  default = "sethu"
}

variable "target_tag_name" {
  type    = string
  default = "target Server"
}

variable "target_eip_name" {
  type    = string
  default = "target_ip"

}

variable "target_sg_group_name" {
  type    = string
  default = "target_sg_group"
}

variable "target_ingress_from_port" {
  type    = list(number)
  default = [22, 80]
}

variable "target_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "target_protocol" {
  type    = string
  default = "tcp"
}

variable "target_ingress_to_port" {
  type    = list(number)
  default = [22, 80]
}

variable "target_egress_from_port" {
  type    = number
  default = 0
}

variable "target_egress_to_port" {
  type    = number
  default = 65535
}

variable "target_volume_size" {
  default = 30
  type    = number
}

variable "target_volume_type" {
  default = "gp2"
  type    = string
}

variable "target_volume_encryption" {
  default = true
  type    = bool
}
