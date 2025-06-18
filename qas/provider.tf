terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment         = var.environment
      Template            = "infra-new-account"
      Provisioning-method = "terraform"
      Domain              = var.domain
    }
  }
}