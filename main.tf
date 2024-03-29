terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.default_tags
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  azs                     = var.availability_zones
  cidr                    = var.cidr
  map_public_ip_on_launch = true
  name                    = var.vpc_name
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_addons                       = var.cluster_addons
  cluster_endpoint_public_access       = true
  cluster_name                         = var.cluster_name
  control_plane_subnet_ids             = module.vpc.private_subnets
  eks_managed_node_groups              = var.eks_managed_node_groups
  node_security_group_additional_rules = var.node_security_group_additional_rules
  subnet_ids                           = module.vpc.public_subnets
  vpc_id                               = module.vpc.vpc_id
}
