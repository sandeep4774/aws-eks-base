include "root" {
  path = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
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
  name               = include.root.locals.name
  domain_name        = include.root.locals.domain_name
  environment        = include.root.locals.environment
  region             = include.root.locals.region
  az_count           = include.root.locals.az_count
  allowed_ips        = include.root.locals.allowed_ips
  zone_id               = dependency.aws-resources.outputs.route53_zone_id
  vpc_id                = dependency.aws-resources.outputs.vpc_id
  vpc_cidr              = dependency.aws-resources.outputs.vpc_cidr
  eks_cluster_id        = dependency.aws-resources.outputs.eks_cluster_id
  eks_oidc_provider_arn = dependency.aws-resources.outputs.eks_oidc_provider_arn
  ssl_certificate_arn = dependency.aws-resources.outputs.ssl_certificate_arn
}
