variable "groups" {
  type = map(object({
    name        = string
    description = optional(string)
  }))
}

variable "user_group_assignments" {
  description = "Map of users and their groups"
  type        = map(set(string))

  # validation {
  #   condition     = alltrue([for user, assignments in var.user_group_assignments : length(setsubtract(keys(var.groups), assignments)) == 0])
  #   error_message = "Group not recognised"
  # }
}
