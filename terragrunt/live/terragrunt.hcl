terragrunt_version_constraint = ">= 0.36"
skip                          = true

locals{

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  region              = local.region_vars.locals.region
  environment         = local.environment_vars.locals.environment
  remote_state_bucket = "${get_env("TF_REMOTE_STATE_BUCKET")}"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    region         = local.region
    bucket         = local.remote_state_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    # dynamodb_table = "${local.remote_state_bucket}-${path_relative_to_include()}"
    encrypt        = true

    skip_metadata_api_check     = true
    skip_credentials_validation = true
  }
}

inputs = merge(
  local.region_vars.locals,
  local.environment_vars.locals,
)
