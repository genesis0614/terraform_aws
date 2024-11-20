# 테라폼 블록(생략 가능-최신버전이됨)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

# 프로바이더 블록
provider "aws" {
  region = "ap-northeast-2"
}