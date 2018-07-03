provider "aws" {
  region  = "eu-west-1"
  profile = "colm-prunty"
}

terraform {
  backend "s3" {
    bucket         = "colm-prunty-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-management"
    profile        = "colm-prunty"
  }
}
