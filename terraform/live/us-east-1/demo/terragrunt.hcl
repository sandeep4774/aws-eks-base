locals {
  ##########
  # Common
  ##########
  name        = "maddevs"
  domain_name = "maddevs.org"
  environment = "demo"

  ##########
  # Network
  ##########
  region   = "us-east-1"
  az_count = 3
  allowed_ips = [
    "212.42.109.196/32",
    "212.42.107.134/32"
  ]
  single_nat_gateway = true
}
