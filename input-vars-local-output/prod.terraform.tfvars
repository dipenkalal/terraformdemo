ec_instance_type = "t2.large"


ec_Volume_config = {
  type = "gp3"
  size = 50
}


additional_tags = {
  ValuesFrom = "prod.terraform.tfvars"
}