#https://github.com/cloudposse/terraform-null-label
resource "null_resource" "default" {
  count = var.enabled ? 1 : 0
  triggers = {
    id = lower(
      join(
        var.delimiter,
        compact(
          concat(
            [
              var.business_unit,
              var.environment,
              var.project_name,
              var.application_name,
              var.region
            ],
            var.attributes,
          ),
        ),
      ),
    )
    name = lower(
      join(
        var.delimiter,
        compact(concat([var.environment, var.project_name, var.application_name])),
      ),
    )
    random_name = lower(
      join(
        var.delimiter,
        compact(concat([var.environment, var.project_name, var.application_name, join("", random_string.random.*.result)])),
      ),
    )
    project_name     = lower(format("%v", var.project_name))
    application_name = lower(format("%v", var.application_name))
    business_unit    = lower(format("%v", var.business_unit))
    managed_by       = lower(format("%v", var.managed_by))
    environment      = lower(format("%v", var.environment))
    attributes       = lower(format("%v", join(var.delimiter, compact(var.attributes))))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_string" "random" {
  count   = var.enabled ? 1 : 0
  length  = 8
  special = false
  upper   = false
  lower   = true
  number  = false
}

terraform {
  experiments = [variable_validation]
}