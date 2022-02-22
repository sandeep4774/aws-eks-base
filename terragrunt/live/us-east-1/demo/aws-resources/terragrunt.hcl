include "root" {
  path = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  name = local.environment_vars.locals.name
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../../terraform//layer1-aws"
}
