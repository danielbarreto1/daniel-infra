vpc_cidr_block     = "10.128.0.0/18"
availability_zones = ["us-east-1a", "us-east-1b"]
region             = "us-east-1"

tags = {
  Owner       = "infra"
  Domain      = "inteligencia-dados"
  Environment = "prd"
  Provisioning-method   = "terraform"
}

tags_vpc = {
  Name        = "id-prd-vpc"
}

private_subnet_names = [
  "id-prd-subnet-private1-us-east-1a",
  "id-prd-subnet-private2-us-east-1b",
  "id-prd-subnet-private3-us-east-1b",
  "id-prd-subnet-private4-us-east-1b"
]

public_subnet_names = [
  "id-prd-subnet-public1-us-east-1a",
  "id-prd-subnet-public2-us-east-1b"
]

// Cidr Blocks subnets
subnet_cidr_blocks_private = [
  "10.128.8.0/22",
  "10.128.12.0/22",
  "10.128.16.0/22",
  "10.128.20.0/22"
]

subnet_cidr_blocks_public = [
  "10.128.0.0/22",
  "10.128.4.0/22"
]


// Route-tables

private_route_table_names = [
  "id-prd-rtb-private1-us-east-1a",
  "id-prd-rtb-private2-us-east-1b",
  "id-prd-rtb-private3-us-east-1b",
  "id-prd-rtb-private4-us-east-1b"
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

// Ec2

ec2_key_name = "chave-infra"

ec2_bi = {
  name          = "ec2-bi"
  ami           = "ami-0abc123456789def0"
  instance_type = "t3.medium"
}

private_ips = {
  ec2_bi = "10.0.1.100"
}