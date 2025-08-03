variable "region_amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-08a6efd148b1f7504"
    "us-east-2" = "ami-08ca1d1e465fbfe0c"
    "us-west-1" = "ami-032db79bb5052ca0f"
    "us-west-2" = "ami-054b7fc3c333ac6d2"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}