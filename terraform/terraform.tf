terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket       = "227385018340-tfstate-61078282"
    key          = "azure.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
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
