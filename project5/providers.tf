terraform {
  required_version = "~>1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"

}

resource "aws_s3_bucket" "us-east-2" {
  bucket = "ahsdkjahfhkasjdfkj"

}

resource "aws_s3_bucket" "us-east-1" {
  bucket   = "ahsdkjahfhkasjdfkj65"
  provider = aws.us-east-1

}