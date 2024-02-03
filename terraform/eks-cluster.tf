module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name                      = var.eks_cluster_name
  cluster_version                   = var.eks_cluster_version
  cluster_endpoint_private_access   = var.eks_private_endpoint_access
  cluster_endpoint_public_access    = var.eks_public_endpoint_access
  vpc_id                            = module.vpc.vpc_id
  subnet_ids                        = module.vpc.private_subnets
  enable_irsa                       = var.eks_enable_irsa
  cluster_addons                    = var.eks_cluster_addons
  eks_managed_node_group_defaults   = var.eks_managed_node_group_defaults
  eks_managed_node_groups           = var.eks_managed_node_groups
}
