variable "name" {
  description = "Name of Website and all the associated Resources."
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
variable "sku_name" {
  description = "Name of App Gateway SKU."
  default     = "Standard_Small"
}
variable "is_public_ip_allocation_static" {
  description = "Is the public IP address of the App Gateway static?"
  default     = false
}
// variable "backend_address_pools" {
//   description = "List of backend address pools."
//   type = list(object({
//     name         = string
//     ip_addresses = list(string)
//   }))
// // }
// variable "backend_address_pool_name" {
//   description = "Name of backend address pools."
// }
// variable "backend_http_settings" {
//   description = "List of backend HTTP settings."
//   type = list(object({
//     name                                = string
//     has_cookie_based_affinity           = bool
//     port                                = number
//     is_https                            = bool
//     request_timeout                     = number
//     pick_host_name_from_backend_address = bool
//     probe_name                          = string
//   }))
// }
// variable "http_listeners" {
//   description = "List of HTTP listeners."
//   type = list(object({
//     name     = string
//     is_https = bool
//   }))
// }
// variable "request_routing_rules" {
//   description = "Request routing rules to be used for listeners."
//   type = list(object({
//     name                       = string
//     is_path_based              = bool
//     http_listener_name         = string
//     backend_address_pool_name  = string
//     backend_http_settings_name = string
//   }))
// }
// variable "probes" {
//   description = "Health probes used to test backend health."
//   default     = []
//   type = list(object({
//     name     = string
//     is_https = bool
//   }))
// }