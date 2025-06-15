provider "aws" {
  region = var.region

}

locals {
  common_tags = var.tags
}

module "vpc" {
  source         = "../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  #tags           = var.tags # Utilizar tags = merge(var.tags, var.tags_vpc) em caso de adição de tags específicas
  tags = merge(var.tags, var.tags_vpc)
}

module "subnets" {
  source                     = "../modules/subnets"
  vpc_id                     = module.vpc.vpc_id
  tags                       = var.tags
  private_subnet_names       = var.private_subnet_names
  public_subnet_names        = var.public_subnet_names
  subnet_cidr_blocks_private = var.subnet_cidr_blocks_private
  subnet_cidr_blocks_public  = var.subnet_cidr_blocks_public
  availability_zones         = var.availability_zones
}

module "route_tables" {
  source = "../modules/route-tables"

  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.subnets.public_subnet_ids
  private_subnet_ids     = module.subnets.private_subnet_ids
  internet_gateway_id    = module.internet-gtw.igw_id
  nat_gateway_id         = module.nat-gtw.nat_gateway_id

  private_route_table_names = var.private_route_table_names
  routes_rtb_private1       = var.routes_rtb_private1
  routes_rtb_private2       = var.routes_rtb_private2

  destination_cidr_block = "0.0.0.0/0"
  tags                   = var.tags
}

module "internet-gtw" {
  source = "../modules/internet-gtw"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags

}

module "security_group" {
  source          = "../modules/security-group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups
  tags            = var.tags

}

module "elastic-ip" {
  source = "../modules/elastic-ip"
  eips   = var.eips
  tags   = var.tags
}

module "nat-gtw" {
  source           = "../modules/nat-gtw"
  allocation_id    = module.elastic-ip.allocation_ids["nat_gateway"]
  public_subnet_id = module.subnets.public_subnet_ids[0]
  depends_on       = [module.internet-gtw]
  tags             = var.tags
}

module "ec2" {
  source = "../modules/ec2"

  name              = var.ec2_bi.name
  ami               = var.ec2_bi.ami
  instance_type     = var.ec2_bi.instance_type
  key_name          = var.ec2_key_name
  subnet_id         = module.subnets.private_subnet_ids[0]
  security_group_id = module.security_group.security_group_id["sg_teste"]
  private_ip        = var.private_ips["ec2_bi"]
  tags              = var.tags
}

