include "root" {
  path = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}

terraform {
  source = "../../../..//layer1-aws"
}

inputs = {
  name               = include.root.locals.name
  domain_name        = include.root.locals.domain_name
  environment        = include.root.locals.environment
  region             = include.root.locals.region
  az_count           = include.root.locals.az_count
  allowed_ips        = include.root.locals.allowed_ips
  single_nat_gateway = include.root.locals.single_nat_gateway
}
