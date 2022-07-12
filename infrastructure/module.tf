terraform {
  backend "s3" {
    bucket = "TF_STATE_BUCKET"
    key    = "tf_state"
    region = "YOUR_AWS_REGION"
  }
}

module "ansible_ec2" {
  source = "./app_ec2"
}

module "target_ec2" {
  source = "./target_ec2"
}
