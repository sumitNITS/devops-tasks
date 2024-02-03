variable "region_name" {
  description = "The name of the Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.32.0/24"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.64.0/24", "10.0.96.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Use one NAT gateway per availability zone"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "test-eks"
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.28"
}

variable "eks_private_endpoint_access" {
  description = "Whether the EKS cluster endpoint has private access"
  type        = bool
  default     = true
}

variable "eks_public_endpoint_access" {
  description = "Whether the EKS cluster endpoint has public access"
  type        = bool
  default     = true
}

variable "eks_enable_irsa" {
  description = "Enable IAM Roles for Service Accounts (IRSA) for the EKS cluster"
  type        = bool
  default     = true
}

variable "eks_cluster_addons" {
  description = "Map of EKS cluster addons and their configurations"
  type        = map(object({
    most_recent = bool
  }))
  default = {
    coredns = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni = { most_recent = true }
  }
}

variable "eks_managed_node_group_defaults" {
  description = "Default configurations for EKS managed node groups"
  type        = object({
    disk_size = number
  })
  default = {
    disk_size = 50
  }
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node groups and their configurations"
  type        = map(object({
    desired_size    = number
    min_size        = number
    max_size        = number
    labels          = map(string)
    instance_types  = list(string)
    capacity_type   = string
  }))
  default = {
    nodes = {
      desired_size   = 2
      min_size       = 2
      max_size       = 4
      labels         = { role = "nodes" }
      instance_types = ["m6a.large"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
