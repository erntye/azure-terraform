locals {
    name = "test1"
}
name = local.name
rg_location = "Southeast Asia"
tier = "Standard"
size = "S1"
sku_name ="Standard_Small"
// backend_address_pools = [{}]
backend_http_settings = [ {
    name                                = "${local.name}-http-set"
    has_cookie_based_affinity           = false
    port                                = 80
    is_https                            = false
    request_timeout                     = 30
    pick_host_name_from_backend_address = true
  }]
http_listeners = [{
    name = "${local.name}-http-lstn"
    is_https = true
}]
request_routing_rules = [{
    name                       = "${local.name}-routing-rule"
    http_listener_name         = "${local.name}-http-lstn"
    backend_address_pool_name  = "${local.name}-beap"
    backend_http_settings_name = "${local.name}-http-set"
}]