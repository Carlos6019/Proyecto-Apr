module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.clusterName
  cluster_version = "1.30"

  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2023_x86_64_STANDARD"
  }

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  eks_managed_node_groups = {
    node-group = {
      name           = "node-group-1"
      instance_types = ["t2.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2

      tags = {
        Environment = "kubernetes-eks"
      }
    }
  }

  tags = {
    terraform   = "true"
    Environment = "production"
  }
}