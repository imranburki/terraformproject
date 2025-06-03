variable "main_region" {
  type = string
}

variable "vpc_cidr" {
  description = "value for vpc cidr block"
  type = string
}
variable "env" {
  type = string
}

variable "public_subnet" {
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
}


variable "private_subnet" {
  type = list(object({
    name = string
    cidr = string
    zone = string 
  }))
}
variable "public_instance" {
  type = string
}