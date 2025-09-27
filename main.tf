module "network" {
  source = "./network"
}

module "compute" {
  source    = "./compute"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id
  sg_id     = module.network.web_sg_id
}

module "database" {
  source    = "./database"
  subnet_id = module.network.public_subnet_id
  sg_id     = module.network.web_sg_id
}

module "storage" {
  source = "./storage"
}

module "monitoring" {
  source = "./monitoring"
  ec2_id = module.compute.ec2_id
}
