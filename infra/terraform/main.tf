provider "aws" {
  region = var.region
}

module "k8s" {
  source = "./modules/k8s"
}