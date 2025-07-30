variable "ec_instance_type" {
  type    = string
  default = "t2.micro"

  validation {
    condition = var.ec_instance_type == "t2.micro"
    error_message = "only supported type is t2.micro"
  }
}

variable "ec_Volume_type" {
  type = string
}

variable "ec_volume_size" {
  type = number
}