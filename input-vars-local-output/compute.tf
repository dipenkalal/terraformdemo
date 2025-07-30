locals {
  project       = "input-vars-local-output"
  project_owner = "dipen"
  cost_center   = "0001"
  managed_by    = "Terraform"

  commontags = {
    project       = local.project
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "Compute" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec_instance_type
  subnet_id     = data.aws_subnets.default.ids[0]

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec_Volume_config.size
    volume_type           = var.ec_Volume_config.type
  }
  tags = merge(local.commontags, var.additional_tags)
}

provider "aws" {
  region = "us-east-2"
}