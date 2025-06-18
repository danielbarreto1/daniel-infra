module "vpc" {
  source = "git::https://github.com/rumolog/infra-modulos//vpc?ref=main"
  vpc_cidr_block = "10.50.0.0/18"
  tags = {
    Name = "infra-dev-vpc"
  }
  enable_flow_log          = true
  flow_log_traffic_type    = "REJECT"
  flow_log_log_destination = module.flow_log_bucket.bucket_arn
  domain                   = var.domain
  depends_on = [module.flow_log_bucket]
}

module "subnets" {
  source = "git::https://github.com/rumolog/infra-modulos//subnets?ref=main"
  vpc_id                     = module.vpc.vpc_id
  private_subnet_names       = var.private_subnet_names
  public_subnet_names        = var.public_subnet_names
  subnet_cidr_blocks_private = var.subnet_cidr_blocks_private
  subnet_cidr_blocks_public  = var.subnet_cidr_blocks_public
  availability_zones         = var.availability_zones
}

# module "route_tables" {
#   source = "git::https://github.com/rumolog/infra-modulos//route-tables?ref=main"

#   vpc_id              = module.vpc.vpc_id
#   public_subnet_ids   = module.subnets.public_subnet_ids
#   private_subnet_ids  = module.subnets.private_subnet_ids
#   internet_gateway_id = module.internet-gtw.igw_id
#   nat_gateway_id      = module.nat-gtw.nat_gateway_id

#   private_route_table_names = var.private_route_table_names
#   routes_rtb_private1       = var.routes_rtb_private1
#   routes_rtb_private2       = var.routes_rtb_private2

#   destination_cidr_block = "0.0.0.0/0"

#   depends_on = [module.vpc, module.subnets]
# }

# module "internet-gtw" {
#   source = "git::https://github.com/rumolog/infra-modulos//internet-gtw?ref=main"
#   vpc_id = module.vpc.vpc_id
#   tags = {
#     Name = "infra-dev-igw"
#   }
# }

# module "security_group" {
#   source          = "../../modulo-infra/security-group"
#   vpc_id          = module.vpc.vpc_id
#   security_groups = var.security_groups
#   tags            = var.tags

# }

# module "elastic-ip" {
#   source = "git::https://github.com/rumolog/infra-modulos//elastic-ip?ref=main"
#   eips   = var.eips
# }

# module "nat-gtw" {
#   source = "git::https://github.com/rumolog/infra-modulos//nat-gtw?ref=main"
#   allocation_id    = module.elastic-ip.allocation_ids["nat_gateway"]
#   public_subnet_id = module.subnets.public_subnet_ids[0]
#   depends_on       = [module.internet-gtw]
#   tags = {
#     Name = "infra-dev-nat"
#   }
# }

module "flow_log_bucket" {
  source = "git::https://github.com/rumolog/infra-modulos//flow-log-bucket?ref=main"
  domain     = var.domain
  account_id = var.account_id
  region     = var.region
}