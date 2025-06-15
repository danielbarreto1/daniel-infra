vpc_cidr_block     = "10.37.0.0/18"
availability_zones = ["us-east-1a", "us-east-1b"]
region             = "us-east-1"

tags = {
  Owner       = "infra"
  Domain      = "inteligencia-dados"
  Environment = "dev"
  Provisioning-method   = "terraform"
}

tags_vpc = {
  Name        = "id-dev-vpc"
}

private_subnet_names = [
  "iddev-subnet-private1-us-east-1a",
  "iddev-subnet-private2-us-east-1b",
  "iddev-subnet-private4-us-east-1a",
  "iddev-subnet-private5-us-east-1b"
]

public_subnet_names = [
  "iddev-subnet-public1-us-east-1a",
  "iddev-subnet-public2-us-east-1b"
]

// Cidr Blocks subnets
subnet_cidr_blocks_private = [
  "10.37.12.0/22",
  "10.37.16.0/22",
  "10.37.24.0/22",
  "10.37.28.0/22",
]

subnet_cidr_blocks_public = [
  "10.37.0.0/22",
  "10.37.4.0/22"
]


// Route-tables

private_route_table_names = [
  "iddev-rtb-private1-us-east-1a",
  "iddev-rtb-private2-us-east-1b",
  "iddev-rtb-private4-us-east-1a",
  "iddev-rtb-private5-us-east-1b",
  "iddev-rtb-private6-us-east-1c"
]

routes_rtb_private1 = [
  "10.0.0.0/16"
]

routes_rtb_private2 = [
  "192.168.0.0/16"
]

// Eips 

eips = {
  nat_gateway = {
    allocation_id = null
    tags = {
      Name       = "eip-nat"
    }
  }
}

