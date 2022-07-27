terraform {
  backend "s3" {
    bucket = "tf-state-sethu"
    key    = "tf_state"
    region = "us-east-1"
  }
}

module "ansible_instance" {
  source = "./ec2_instances/ansible_instance"
}

module "jenkins_instance" {
  source = "./ec2_instances/jenkins_instance"
}

module "mlflow_instance" {
  source = "./ec2_instances/mlflow_instance"
}

module "application_instance" {
  source = "./ec2_instances/application_instance"
}

module "eks_cluster" {
  source = "./eks_cluster"
}
