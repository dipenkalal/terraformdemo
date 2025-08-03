terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example1" {
  count         = var.create_instance ? 1 : 0
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  tags = {
    Name = "ConditionalInstance"
  }
}
resource "aws_instance" "example2" {
  count         = 1
  ami           = "ami-08a6efd148b1f7504"
  instance_type = var.environment == "prod" ? "t2.micro" : "t2.micro"

  tags = {
    Name = "EnvBasedInstance"
  }
}
resource "aws_instance" "example3" {
  count         = (var.create_instance && var.environment == "prod") ? 1 : 0
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"

  tags = {
    Name = "ProdOnlyInstance"
  }
}
locals {
  instance_type = (
    var.environment == "prod"    ? "t2.micro" :
    var.environment == "staging" ? "t2.micro" :
                                   "t2.micro"
  )
}
resource "aws_instance" "example4" {
  count         = 1
  ami           = "ami-08a6efd148b1f7504"
  instance_type = local.instance_type

  tags = {
    Name = "LocalDrivenInstance"
  }
}
resource "aws_instance" "example5" {
  count         = (var.create_instance &&
                   (var.environment == "prod" || var.environment == "dev")) ? 1 : 0
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"

  tags = {
    Name = "DevOrProdInstance"
  }
}



