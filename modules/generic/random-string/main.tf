resource "random_string" "string" {
  length  = var.length
  special = var.special
  upper   = var.upper
  lower   = var.lower
  number  = var.number
}
