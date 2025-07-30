terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.0"
    }
  }
}

#managed by us
resource "aws_s3_bucket" "handsonuserncpl" {
    bucket = var.bucket_name
  
}

#managed somewhere else, we just want to use it in our project
data "aws_s3_bucket" "my_external_bucket_ncpl" {
  bucket = "not managed by us"
}

variable "bucket_name" {
  type = string
  description = "variable used to set bucket name"
  default = "my_default_bucket_name_ncpl"
}

output "bucket_id" {
    value = aws_s3_bucket.handsonuserncpl.id
}

locals {
  local_example="local value"
}

module "my_module" {
  source = "./module-example"
}