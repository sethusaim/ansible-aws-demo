terraform {
  backend "s3" {
    bucket = "tf-state-sethu"
    key    = "tf_state"
    region = "us-east-1"
  }
}

module "ansible_instance" {
  source = "./ansible_instance"
}

module "jenkins_instance" {
  source = "./jenkins_instance"
}

module "mlflow_instance" {
  source = "./mlflow_instance"
}

module "application_instance" {
  source = "./application_instance"
}
