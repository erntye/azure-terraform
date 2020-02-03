variable "rg_location" {
  description = "Resource Group location."
}
variable "rg_name" {
  description = "Resource Group name."
}
variable "name" {
  description = "Name of App Gateway"
}
variable "tier" {
  description = "Tier of App Gateway SKU."
}
variable "sku_name" {
  description = "Name of App Gateway SKU."
  default     = "Standard_Small"
}
variable "is_public_ip_allocation_static" {
  description = "Is the public IP address of the App Gateway static?"
  default     = false
}
variable "backend_address_pools" {
  description = "List of backend address pools."
  type = list(object({
    name         = string
    ip_addresses = list(string)
  }))
}
variable "backend_http_settings" {
  description = "List of backend HTTP settings."
  type = list(object({
    name                                = string
    has_cookie_based_affinity           = bool
    port                                = number
    is_https                            = bool
    request_timeout                     = number
    pick_host_name_from_backend_address = bool
    probe_name                          = string
  }))
}
variable "http_listeners" {
  description = "List of HTTP listeners."
  type = list(object({
    name     = string
    is_https = bool
  }))
}
variable "request_routing_rules" {
  description = "Request routing rules to be used for listeners."
  type = list(object({
    name                       = string
    is_path_based                  = bool
    http_listener_name         = string
    backend_address_pool_name  = string
    backend_http_settings_name = string
  }))
}



variable "probes" {
  description = "Health probes used to test backend health."
  default     = []
  type        = list(object({
    name     = string
    is_https = bool
  }))
}

// variable "url_path_maps" {
//   description = "URL path maps associated to path-based rules."
//   default     = []
//   type = list(object({
//     name                               = string
//     default_backend_http_settings_name = string
//     default_backend_address_pool_name  = string
//     path_rules = list(object({
//       name                       = string
//       backend_address_pool_name  = string
//       backend_http_settings_name = string
//       paths                      = list(string)
//     }))
//   }))
// }