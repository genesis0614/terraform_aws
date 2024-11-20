terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source         = "https://github.com/genesis0614/terraform_aws/12.module/vpc"
  pjt_name       = "netid"
  vpc_cidr_block = "10.0.0.0/16"
}

module "pub_sn_1" {
  source        = "https://github.com/genesis0614/terraform_aws/12.module/subnet"
  pjt_name      = var.pjt_name
  vpc_id        = module.vpc.vpc_id
  sn_cidr_block = "10.0.1.0/24"
  az_name       = data.aws_availability_zones.available.names[0]
}

module "pub_sn_2" {
  source        = "https://github.com/genesis0614/terraform_aws/12.module/subnet"
  pjt_name      = var.pjt_name
  vpc_id        = module.vpc.vpc_id
  sn_cidr_block = "10.0.2.0/24"
  az_name       = data.aws_availability_zones.available.names[2]
}
