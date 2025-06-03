
variable "env" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "public_subnet" {
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
}
