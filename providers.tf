terraform {
  required_providers {
    saviynt = {
      source  = "saviynt/saviynt"
      version = "~> 0.3"
    }
  }
  required_version = ">= 1.11"
}

provider "saviynt" {
  server_url = var.server_url
  username   = var.username
  password   = var.password
}