provider "aws" {
  region = "us-west-2"
}

module "network" {
  source = "./modules/network"
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.network.public_subnets[0]
}

module "alb" {
  source = "./modules/alb"
  subnets = module.network.public_subnets
  target_id = module.ec2.instance_id
  vpc_id = module.network.vpc_id
}
