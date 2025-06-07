resource "aws_s3_bucket" "sample_bucket" {
  bucket = "058264337777-sample-bucket-ewioe22"
}

# data "azuread_client_config" "current" {}

# data "azuread_users" "users" {
#   return_all = true
# }

# locals {
#   users = { for user in data.azuread_users.users.users : user.mail_nickname => {
#     id = user.object_id
#   } if contains(keys(var.user_group_assignments), user.mail_nickname) }

#   assignments = merge([for user, groups in var.user_group_assignments : {
#     for group in groups : join("-", [user, group]) => {
#       user  = user
#       group = group
#     }
#   }]...)
# }

# resource "azuread_group" "for" {
#   for_each = var.groups

#   display_name            = each.value.name
#   description             = each.value.description
#   owners                  = [data.azuread_client_config.current.object_id]
#   prevent_duplicate_names = true
#   security_enabled        = true
# }

# resource "azuread_group_member" "assignment" {
#   for_each = local.assignments

#   group_object_id  = azuread_group.for[each.value.group].object_id
#   member_object_id = local.users[each.value.user].id
# }
