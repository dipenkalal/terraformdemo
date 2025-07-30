variable "ec_instance_type" {
  type = string

  validation {
    condition     = startswith(var.ec_instance_type, "t2")
    error_message = "only supported type is t2 family"
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