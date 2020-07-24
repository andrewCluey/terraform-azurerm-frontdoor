resource "azurerm_frontdoor" "front_door" {
  name                                         = var.front_door_name
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = var.enforce_cert_check
  tags                                         = var.tags

  routing_rule {
    name               = "RoutingRule1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["FrontendEndpoint1"]

    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "BackendPool"
    }
  }

  backend_pool_load_balancing {
    name = "LoadBalancingSettings1"
  }

  backend_pool_health_probe {
    name = "HealthProbe1"
  }

  backend_pool {
    name = "BackendPool"
    backend {
      host_header = var.be_host_header
      address     = var.be_address
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "LoadBalancingSettings1"
    health_probe_name   = "HealthProbe1"
  }

  frontend_endpoint {
    name                              = "FrontendEndpoint1"
    host_name                         = var.fe_host_name
    custom_https_provisioning_enabled = false
  }
}