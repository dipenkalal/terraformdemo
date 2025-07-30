variable "ec_instance_type" {
  type = string

  validation {
    condition     = var.ec_instance_type == "t2.micro"
    error_message = "only supported type is t2.micro"
  }
}

variable "ec_Volume_config" {
  type = object({
    size = number
    type = string
  })
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}