terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [ aws.usw1 ]
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
   required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
 }

  
provider "aws" {
  alias  = "usw1"
  region = "us-west-1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}