variable "name" {
  description = "Name of app service."
}

variable "rg_location" {
  description = "Resource Group location."
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

variable "SQL_SERVER_USER" {
  description = "SQL Server username"
}
variable "SQL_SERVER_PW" {
  description = "SQL Server password"
}