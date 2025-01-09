data "azuread_client_config" "current" {}

data "azuread_users" "users" {
  return_all = true
}

locals {
  users = { for user in data.azuread_users.users.users : user.mail_nickname => {
    id = user.object_id
  } if contains(keys(var.user_group_assignments), user.mail_nickname) }

  assignments = flatten([for user, groups in var.user_group_assignments : [
    for group in groups : join("-", [user, group])
  ]])
}

resource "azuread_group" "for" {
  for_each = var.groups

  display_name            = each.key
  description             = each.value
  owners                  = [data.azuread_client_config.current.object_id]
  prevent_duplicate_names = true
  security_enabled        = true
}

resource "azuread_group_member" "example" {
  group_object_id  = azuread_group.example.object_id
  member_object_id = local.users["steve-engineer"].id
}
