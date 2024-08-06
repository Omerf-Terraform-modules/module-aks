resource "azurerm_kubernetes_cluster" "aks" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  private_cluster_enabled    = true
  dns_prefix_private_cluster = var.dns_prefix_private_cluster
  private_dns_zone_id        = var.private_dns_zone_id
  sku_tier                   = "Standard"

  default_node_pool {
    name            = var.default_node_pool.name
    node_count      = var.default_node_pool.node_count
    vm_size         = var.default_node_pool.vm_size
    os_disk_size_gb = var.default_node_pool.os_disk_size_gb
    vnet_subnet_id  = var.default_node_pool.vnet_subnet_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = var.identity_ids
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku

    service_cidr   = "172.22.0.0/16"
    dns_service_ip = "172.22.0.10"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = var.tags
}
