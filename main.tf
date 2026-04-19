provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}

module "compute" {
  source            = "./modules/compute"
  vpc_id            = module.vpc.vpc_id
  subnets           = module.vpc.private_subnets
  target_group_arn  = module.alb.target_group_arn
  instance_role_arn = module.iam.ec2_role_arn
}

module "rds" {
  source      = "./modules/rds"
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.private_subnets
}
