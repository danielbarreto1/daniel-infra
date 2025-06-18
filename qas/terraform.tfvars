availability_zones = ["us-east-1a", "us-east-1b"]

private_subnet_names = [
  "infra-qas-subnet-private1-az-1a",
  "infra-qas-subnet-private2-az-1b",
  "infra-qas-subnet-private3-az-1a",
  "infra-qas-subnet-private4-az-1b"
]

public_subnet_names = [
  "infra-qas-subnet-public1-az-1a",
  "infra-qas-subnet-public2-az-1b"
]

// Cidr Blocks subnets
subnet_cidr_blocks_private = [
  "10.60.8.0/22",
  "10.60.12.0/22",
  "10.60.16.0/22",
  "10.60.20.0/22"
]

subnet_cidr_blocks_public = [
  "10.60.0.0/22",
  "10.60.4.0/22"
]

// Route-tables

private_route_table_names = [
  "infra-qas-rtb-private1-az-1a",
  "infra-qas-rtb-private2-az-1b",
  "infra-qas-rtb-private3-az-1b",
  "infra-qas-rtb-private4-az-1b"
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
      Name = "eip-nat"
    }
  }
}

