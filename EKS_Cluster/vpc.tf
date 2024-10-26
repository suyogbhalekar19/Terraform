locals {
  cluster_name = "suyog-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name                 = "eks-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available_azs.names
  private_subnets      = var.public_subnets
  public_subnets       = var.private_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "kubernetes.io/cluster/${locals.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${locals.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${locals.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
