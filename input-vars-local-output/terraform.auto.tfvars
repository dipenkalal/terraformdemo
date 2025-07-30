additional_tags = {
  ValuesFrom = "prod.terraform.tfvars"
}

#$env:TF_VAR_ec_instance_type = "t2.micro"

#4 # TF_VAR instance type     = "t3.micro" Example
#3 # terraform.tfvars         = "t3.small" Example
#2 # prod.auto.tfvars         = "t3.large" Example
#1 # -var CLI                 = "t3.xlarge" Example
