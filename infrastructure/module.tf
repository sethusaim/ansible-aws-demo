terraform {
  backend "s3" {
    bucket = "tf-state-sethu"
    key    = "tf_state"
    region = "us-east-1"
  }
}

module "ansible_ec2" {
  source = "./ansible_ec2"
}

# module "target_ec2" {
#   source = "./target_ec2"
# }
