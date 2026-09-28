resource "saviynt_rest_connection_resource" "zoom_conn" {
  connection_name = "zoom_terraform"
  description     = "Zoom Server-to-Server OAuth REST connector via Terraform"

  connection_json = replace(
    replace(
      file("${path.module}/json/connection.json"),
      "__ACCOUNT_ID__", var.zoom_account_id
    ),
    "__BASIC_AUTH_HEADER__", "Basic ${base64encode("${var.zoom_client_id}:${var.zoom_client_secret}")}"
  )
}

resource "saviynt_security_system_resource" "zoom_system" {
  systemname             = "Zoom_TF"
  display_name           = "Zoom TF Security System"
  hostname               = "zoom.us"
  port                   = "443"
  automated_provisioning = "true"
  connectionname         = saviynt_rest_connection_resource.zoom_conn.connection_name

  depends_on = [saviynt_rest_connection_resource.zoom_conn]
}

resource "saviynt_endpoint_resource" "zoom_ep" {
  endpoint_name   = "Zoom_Endpoint"
  display_name    = "Zoom Endpoint"
  security_system = saviynt_security_system_resource.zoom_system.systemname
  description     = "Zoom application onboarded via Terraform"

  depends_on = [
    saviynt_security_system_resource.zoom_system,
    saviynt_rest_connection_resource.zoom_conn
  ]
}