provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}
provider "aws" {
  region = var.region
}
data "aws_availability_zones" "available" {}
locals {
  cluster_name = "architect-eks-${random_string.suffix.result}"
}
resource "random_string" "suffix" {
  length  = 8
  special = false
}

//https://www.architect.io/blog/2023-01-19/kubernetes-cluster-in-aws/

//9rm49p7Kx2iVyQ.atlasv1.FfBIbnOvvQRCd0MdcAjIRALkJCrsq9Vy6XjbUiVLEKO5nr34yAByFiRRIarEkLuND14
