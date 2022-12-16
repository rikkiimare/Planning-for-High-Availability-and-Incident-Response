terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  
  backend "s3" {
     bucket = "udacity-tf-rirving"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

provider "aws" {
   region = "us-east-2"
   
   default_tags {
     tags = local.tags
   }
 }

  
# provider "aws" {
#   alias  = "usw1"
#   region = "us-west-1"
# }