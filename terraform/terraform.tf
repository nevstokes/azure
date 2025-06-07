terraform {
  required_version = ">= 1.12"

  backend "s3" {
    encrypt              = true
    use_lockfile         = true
    workspace_key_prefix = "nevstokes/azure"
    assume_role = {
      role_arn     = "arn:aws:iam::058264337777:role/TerraformProvisioning"
      session_name = "ChainedDeploymentRole"
    }
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

provider "aws" {
  region = "eu-west-1"
}

provider "azuread" {
  use_oidc = true
}
