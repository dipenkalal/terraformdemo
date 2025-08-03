locals {
  project     = "myapp"
  environment = "dev"
  cidr_block  = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  tags = {
    Project     = local.project
    Environment = local.environment
  }
}
