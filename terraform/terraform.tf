terraform {
  required_version = ">= 1.12"

  backend "s3" {
    encrypt              = true
    use_lockfile         = true
    workspace_key_prefix = "nevstokes/azure"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}

data "aws_caller_identity" "current" {}

locals {
  aws_read_role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/TerraformRead"
  aws_write_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/TerraformProvisioning"

  # role_arn = terraform.applying ? local.aws_write_role_arn : local.aws_read_role_arn
  role_arn = local.aws_write_role_arn
}


provider "aws" {
  region = "eu-west-1"

  assume_role {
    role_arn     = local.role_arn
    session_name = "ChainedDeploymentRole"
  }
}

provider "azuread" {
  use_oidc = true
}
