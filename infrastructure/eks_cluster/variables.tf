variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "cluster-name" {
  default = "terraform-eks"
  type    = string
}

variable "cluster_instance_type" {
  default = "t2.medium"
  type    = string
}

variable "eks_cluster_role_name" {
  default = "terraform-eks-cluster-role"
  type    = string
}

variable "wafer_sg_group_name" {
  default = "terraform-eks-cluster"
  type    = string
}

variable "wafer_sg_group_egress_from_port" {
  default = 0
  type    = number
}

variable "wafer_sg_group_egress_to_port" {
  default = 0
  type    = number
}

variable "wafer_sg_group_protocol" {
  default = "-1"
  type    = string
}

variable "wafer_sg_group_cidr_block" {
  default = ["0.0.0.0/0"]
  type    = list(string)
}

variable "wafer_sg_group_tag_name" {
  default = "terraform-eks"
  type    = string
}

variable "wafer_node_iam_role_name" {
  default = "terraform-eks-node"
  type    = string
}

variable "eks_node_group_name" {
  default = "wafer"
  type    = string
}

variable "desired_node_size" {
  default = 2
  type    = number
}

variable "min_node_size" {
  default = 2
  type    = number
}

variable "max_node_size" {
  default = 3
  type    = number
}

variable "cluster_vpc_cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "cluster_vpc_tag_name" {
  default = "terraform-eks-node"
  type    = string
}

variable "cluster_subnet_tag_name" {
  default = "terraform-eks-node"
  type    = string
}

variable "cluster_internet_gateway_tag_name" {
  default = "terraform-eks"
  type    = string
}

variable "route_table_cidr_block" {
  default = "0.0.0.0/0"
  type    = string
}

