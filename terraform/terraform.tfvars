groups = {
  cloud_engineers = {
    name        = "Cloud Engineers"
    description = "General cloud engineers"
  }

  consultants = {
    name        = "Consultants"
    description = "External consultants"
  }

  core_engineers = {
    name        = "Core Engineers"
    description = "Engineers who can access Core accounts"
  }

  developers = {
    name        = "Developers"
    description = "All developers"
  }

  org_admins = {
    name        = "Org Admins"
    description = "Administrators"
  }

  probationers = {
    name        = "Probationers"
    description = "Employees who are on probation"
  }
}

user_group_assignments = {
  "steve-engineer" = [
    "cloud_engineers",
    "org_admins",
  ]
}
