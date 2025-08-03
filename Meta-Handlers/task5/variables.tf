variable "ec2_instances" {
  type = map(object({
    instance_type = string
    ami           = string
  }))
  description = "Map of EC2 instances with their details"
  default = {
    "web" = {
      instance_type = "t2.micro"
      ami           = "ami-0c02fb55956c7d316"
    }
    "db" = {
      instance_type = "t2.micro"
      ami           = "ami-0c02fb55956c7d316"
    }
    "app" = {
      instance_type = "t2.micro"
      ami           = "ami-0c02fb55956c7d316"
    }
  }
}
