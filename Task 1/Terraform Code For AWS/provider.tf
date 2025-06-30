terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "terraformbackupcapstoneproject"         
    key     = "aws-infra/terraform.tfstate"   
    region  = "us-east-1"                      
    encrypt = true                              
  }
}

provider "aws" {
  region = var.aws_region
}