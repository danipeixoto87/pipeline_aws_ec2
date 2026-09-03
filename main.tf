terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "daniel-peixoto-terraform-bucket"
    key    = "pipeline-github/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "Daniel Peixoto"
      managed_by = "Terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "daniel-peixoto-terraform-bucket"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}