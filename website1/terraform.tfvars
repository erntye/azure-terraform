name = "website1"
rg_location = "Southeast Asia"
tier = "Standard"
size = "S1"
sku_name ="Standard_Small"
backend_address_pool_name = "website1-beap"
// backend_address_pools = [{
//       name = "website1-beap" 
//       ip_addresses = ["0.0.0.0","0.0.0.0"]
//     }]
backend_http_settings = [ {
    name                                = "website1-http-set"
    has_cookie_based_affinity           = false
    port                                = 80
    is_https                            = false
    request_timeout                     = 30
    pick_host_name_from_backend_address = true
    probe_name                          = "website1-probe"
  }]
http_listeners = [{
    name = "website1-http-lstn"
    is_https = false
}]
request_routing_rules = [{
    name                       = "website1-routing-rule"
    is_path_based              = false
    http_listener_name         = "website1-http-lstn"
    backend_address_pool_name  = "website1-beap"
    backend_http_settings_name = "website1-http-set"
}]
is_public_ip_allocation_static = false

probes= [{
    name = "website1-probe"
    is_https = false
}]