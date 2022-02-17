include "root" {
  path = find_in_parent_folders()
  expose         = true
}

terraform {
  source = "../../../..//layer2-k8s"
}

dependencies {
  paths = ["../aws-resources"]
}

dependency "aws-resources" {
  config_path = "../aws-resources"
}

inputs = {
  zone_id               = dependency.aws-resources.outputs.route53_zone_id
  vpc_id                = dependency.aws-resources.outputs.vpc_id
  vpc_cidr              = dependency.aws-resources.outputs.vpc_cidr
  eks_cluster_id        = dependency.aws-resources.outputs.eks_cluster_id
  eks_oidc_provider_arn = dependency.aws-resources.outputs.eks_oidc_provider_arn
  ssl_certificate_arn    = dependency.aws-resources.outputs.ssl_certificate_arn
}
