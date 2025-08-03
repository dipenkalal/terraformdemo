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
output "mysql_config" {
  value = {
    instance_type      = var.mysql_config[0]
    replication_factor = var.mysql_config[1]
    enable_monitoring  = var.mysql_config[2]
  }
}
resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  instance_class       = var.mysql_config[0]
  engine               = "mysql"
  engine_version       = "8.0.41"
  username             = "admin"
  password             = "90166Dipen"
  db_name              = "mydb1"
  multi_az             = var.mysql_config[2]  # 
  availability_zone    = "us-east-1a"
  publicly_accessible  = false
    skip_final_snapshot = true

}

