variable "name" {
  description = "Name of app service."
}
variable "rg_location" {
  description = "Resource Group location."
}
variable "rg_name" {
  description = "Resource Group name."
}
variable "tier" {
  description = "App Service Plan tier."
}
variable "size" {
  description = "App Service Plan size."
}
variable "app_settings" {
  description = "App Service's configuration values."
  default     = {}
}
variable "always_on" {
  description = "Whether the App Service should always be on (Basic or above required)."
  default     = false
}
variable "https_only" {
  description = "Whether the App Service only allows HTTPS connections."
  default     = false
}
variable "fully_qualified_domain_name" {
  description = "FQDN of the SQL server needed for the connection string"
}
variable "db_name" {
  description = "Name of the SQL DB needed for the connection string"
}
variable "SQL_SERVER_USER" {
  description = "SQL Server username"
}
variable "SQL_SERVER_PW" {
  description = "SQL Server password"
}