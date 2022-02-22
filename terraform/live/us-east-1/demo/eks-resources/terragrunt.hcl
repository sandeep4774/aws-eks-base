include "root" {
  path = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "${get_terragrunt_dir()}/../../../..//layer2-k8s"
}

dependencies {
  paths = ["../aws-resources"]
}

dependency "aws-resources" {
  config_path = "../aws-resources"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    route53_zone_id       = "Z058363314IT7VAKRA777"
    vpc_id                = "vpc-0f5b1b5f788888888"
    vpc_cidr              = "10.0.0.0/16"
    eks_cluster_id        = "maddevs-demo-use1"
    eks_oidc_provider_arn = "arn:aws:iam::730809894724:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/"
    ssl_certificate_arn    = "arn:aws:acm:us-east-1:730809894724:certificate/"
  }
}

inputs = {
  zone_id               = dependency.aws-resources.outputs.route53_zone_id
  vpc_id                = dependency.aws-resources.outputs.vpc_id
  vpc_cidr              = dependency.aws-resources.outputs.vpc_cidr
  eks_cluster_id        = dependency.aws-resources.outputs.eks_cluster_id
  eks_oidc_provider_arn = dependency.aws-resources.outputs.eks_oidc_provider_arn
  ssl_certificate_arn    = dependency.aws-resources.outputs.ssl_certificate_arn
}
