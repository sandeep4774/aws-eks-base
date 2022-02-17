include "root" {
  path = find_in_parent_folders()
  expose         = true
}

terraform {
  source = "../../../..//layer1-aws"
}
