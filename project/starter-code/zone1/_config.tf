terraform {
  backend "s3" {
     bucket = "udacity-tf-rirving"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

provider "aws" {
  source = "hashicorp/aws"
  version = "~> 3.0"
  region = "us-east-2"
   
  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  alias  = "usw1"
  version = "~> 3.0"
  region = "us-west-1"
}