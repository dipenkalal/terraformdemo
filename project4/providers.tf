terraform {
  required_version = ">=1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  backend "s3" {
    bucket = "terraformbucket-backend"
    key = "project4/state.tfstate"
    region = "us-east-2"
    use_lockfile = true
  }

}

provider "aws" {
  region = "us-east-2"

}

