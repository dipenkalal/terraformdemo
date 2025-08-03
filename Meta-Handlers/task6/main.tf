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
resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-0f88e80871fd81e91"  
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.names)

  bucket = "${each.key}-bucket-123"
}

