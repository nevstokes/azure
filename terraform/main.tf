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

data "azuread_client_config" "current" {}

resource "azuread_group" "example" {
  display_name     = "example"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}
