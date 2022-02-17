locals{
  remote_state_bucket = "${get_env("TF_REMOTE_STATE_BUCKET")}"
}

inputs = {
  remote_state_bucket = local.remote_state_bucket
  region              = local.region
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    region         = include.root.locals.aws_region
    bucket         = local.remote_state_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    # dynamodb_table = "${local.remote_state_bucket}-${path_relative_to_include()}"
    encrypt        = true

    skip_metadata_api_check     = true
    skip_credentials_validation = true
  }
}

terragrunt_version_constraint = "0.35.8"
