terraform {
  required_version = ">= 1.10"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.0"
    }
  }
}

provider "azuread" {
  use_oidc = true
}
