provider "aws" {
  region = "var.region"
  default_tags {
    tags = {
      App_Name    = "ec2_autoscaling_app"
      Environment = "Test"
      Owner       = "DevSecOps Team"
    }
  }
}