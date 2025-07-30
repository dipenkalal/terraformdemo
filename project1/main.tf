terraform {
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

#creating custom vpc with CIDR Block
resource "aws_vpc" "terra_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Terraform VPC"
  }
}

#creating public subnet for vpc with CIDR Block
resource "aws_subnet" "terra_vpc_pub_sub" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = "10.0.0.0/24"

}

#creating private subnet for vpc with CIDR Block
resource "aws_subnet" "terra_vpc_pri_sub" {
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = "10.0.1.0/24"

}

#creating internet gateway and attaching it to vpc
resource "aws_internet_gateway" "terra_vpc_igw" {
  vpc_id = aws_vpc.terra_vpc.id
}


#creating route table and adding the igw to it for internet access
resource "aws_route_table" "terra_vpc_pub_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_vpc_igw.id
  }
}
#route table association
resource "aws_route_table_association" "pub_sub" {
  subnet_id      = aws_subnet.terra_vpc_pub_sub.id
  route_table_id = aws_route_table.terra_vpc_pub_rt.id

}