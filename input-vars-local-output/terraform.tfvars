# ec_instance_type = "t2.micro"


ec_Volume_config = {
  type = "gp3"
  size = 10
}


additional_tags = {
  ValuesFrom = "terraform.tfvars"
}