name = "test2"
rg_location = "Southeast Asia"
tier = "Standard"
size = "S1"
sku_name ="Standard_Small"
backend_address_pool_name = "test2-beap"
// backend_address_pools = [{
//       name = "test2-beap" 
//       ip_addresses = ["0.0.0.0","0.0.0.0"]
//     }]
backend_http_settings = [ {
    name                                = "test2-http-set"
    has_cookie_based_affinity           = false
    port                                = 80
    is_https                            = false
    request_timeout                     = 30
    pick_host_name_from_backend_address = true
    probe_name                          = "test2-probe"
  }]
http_listeners = [{
    name = "test2-http-lstn"
    is_https = false
}]
request_routing_rules = [{
    name                       = "test2-routing-rule"
    is_path_based              = false
    http_listener_name         = "test2-http-lstn"
    backend_address_pool_name  = "test2-beap"
    backend_http_settings_name = "test2-http-set"
}]
is_public_ip_allocation_static = false

probes= [{
    name = "test2-probe"
    is_https = false
}]