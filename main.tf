module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  env = var.env
}
module "security_groups" {
  source = "./modules/security"
  env = var.env
}
module "loadbalancer" {
  source = "./modules/loadbalancer"
  env=var.env

}
module "ec2-instance" {
  source = "./modules/ec2"
  instance_type = var.public_instance
  env = var.env
  public_subnet = var.public_subnet
}