variable "server_url" {
  type        = string
  description = "Saviynt sandbox base URL"
}

variable "username" {
  type        = string
  description = "Saviynt API username"
}

variable "password" {
  type        = string
  description = "Saviynt API password"
  sensitive   = true
}

variable "zoom_client_id" {
  type        = string
  description = "Zoom OAuth Client ID"
  sensitive   = true
}

variable "zoom_client_secret" {
  type        = string
  description = "Zoom OAuth Client Secret"
  sensitive   = true
}

variable "zoom_account_id" {
  type        = string
  description = "Zoom Account ID"
  sensitive   = true
}