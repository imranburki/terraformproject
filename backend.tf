terraform {
  backend "s3" {
    bucket       = "terraform-state-files-host"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}