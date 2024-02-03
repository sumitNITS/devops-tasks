region_name = "us-east-1"

vpc_name = "eks-vpc"
vpc_cidr = "10.0.0.0/16"

availability_zones = ["us-east-1a", "us-east-1b"]

private_subnet_cidrs = ["10.0.0.0/24", "10.0.32.0/24"]
public_subnet_cidrs  = ["10.0.64.0/24", "10.0.96.0/24"]

enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false

enable_dns_hostnames = true
enable_dns_support   = true

eks_cluster_name                   = "test-eks"
eks_cluster_version                = "1.28"
eks_private_endpoint_access         = true
eks_public_endpoint_access          = true
eks_enable_irsa                    = true

eks_cluster_addons = {
  coredns     = { most_recent = true }
  kube-proxy  = { most_recent = true }
  vpc-cni     = { most_recent = true }
}

eks_managed_node_group_defaults = {
  disk_size = 50
}

eks_managed_node_groups = {
  nodes = {
    desired_size    = 2
    min_size        = 2
    max_size        = 4
    labels          = { role = "nodes" }
    instance_types  = ["m6a.large"]
    capacity_type   = "ON_DEMAND"
  }
}
