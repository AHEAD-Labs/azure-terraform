data "terraform_remote_state" "rg" {
  backend = "s3"
  config = {
    bucket = var.state_storage_name
    key    = var.state_key
    region = var.state_location
  }
}