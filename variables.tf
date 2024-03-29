variable "default_tags" {
  type    = map(string)
  default = {}
}

variable "vpc_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "cidr" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  type    = any
  default = { default = {} }
}

variable "node_security_group_additional_rules" {
  type    = any
  default = {}
}

variable "cluster_addons" {
  type    = any
  default = {}
}
