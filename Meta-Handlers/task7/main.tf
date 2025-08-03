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
resource "aws_vpc" "main" {
  cidr_block = local.cidr_block

  tags = merge(local.tags, {
    Name = "${local.project}-${local.environment}-vpc"
  })
}
resource "aws_subnet" "public" {
  for_each = toset(local.public_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = "us-east-1a"

  tags = merge(local.tags, {
    Name = "${local.project}-${local.environment}-subnet-${each.value}"
  })
}
