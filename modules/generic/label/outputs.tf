output "id" {
  value       = join("", null_resource.default.*.triggers.id)
  description = "Disambiguated ID"
}

output "project_name" {
  value       = join("", null_resource.default.*.triggers.project_name)
  description = "Normalized project name"
}

output "name" {
  value       = join("", null_resource.default.*.triggers.name)
  description = "Normalized name"
}

output "random_name" {
  value       = length(null_resource.default[*].triggers) > 0 ? (contains(keys(null_resource.default[0].triggers), "random_name") ? null_resource.default[0].triggers.random_name : "bc_compat") : ""
  description = "Normalized random name"
}

output "application_name" {
  value       = join("", null_resource.default.*.triggers.application_name)
  description = "Normalized application name"
}

output "business_unit" {
  value       = join("", null_resource.default.*.triggers.business_unit)
  description = "Normalized business unit"
}

output "managed_by" {
  value       = join("", null_resource.default.*.triggers.managed_by)
  description = "Normalized managed by"
}

output "environment" {
  value       = join("", null_resource.default.*.triggers.environment)
  description = "Normalized environment"
}

output "attributes" {
  value       = join("", null_resource.default.*.triggers.attributes)
  description = "Normalized attributes"
}

# Merge input tags with our tags.
# Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
output "tags" {
  value = merge(
    {
      "projectName"     = join("", null_resource.default.*.triggers.project_name)
      "applicationName" = join("", null_resource.default.*.triggers.application_name)
      "NICbusinessUnit" = join("", null_resource.default.*.triggers.business_unit)
      "managedBy"       = join("", null_resource.default.*.triggers.managed_by)
      "Environment"     = join("", null_resource.default.*.triggers.environment)
      "Name"            = join("", null_resource.default.*.triggers.name)
    },
    var.tags,
  )

  description = "Normalized Tag map"
}

