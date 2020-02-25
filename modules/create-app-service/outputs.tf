output "possible_outbound_ip_addresses" {
  value = azurerm_app_service.as.possible_outbound_ip_addresses
}

output "default_site_hostname" {
  value = azurerm_app_service.as.default_site_hostname
}
