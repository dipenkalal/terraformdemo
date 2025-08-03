variable "instances" {
  default = {
    web1 = "t2.micro"
    web2 = "t2.medium"
    web3 = "t3.medium"
  }
}
variable "names" {
  default = ["web1abczx", "web2abczx", "web3abczx"]
}
