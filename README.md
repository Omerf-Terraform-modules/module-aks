# Azure Kubernetes Service (AKS) Module

This Terraform module deploys an Azure Kubernetes Service (AKS) cluster along with necessary resources.

## Usage

```hcl
module "aks" {
  source                        = "./terraform-azure-aks"  # Adjust the path as needed
  resource_group_name           = "my-resource-group"
  location                      = "West Europe"
  cluster_name                  = "my-aks-cluster"
  dns_prefix_private_cluster                    = "myaks"
  default_node_pool = {
    name            = "default"
    node_count      = 3
    vm_size         = "Standard_DS2_v2"
    os_disk_size_gb = 30
    vnet_subnet_id  = "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Network/virtualNetworks/{vnet-name}/subnets/{subnet-name}"
  }
  network_plugin                = "azure"
  load_balancer_sku             = "Standard"
  enable_monitoring             = true
  log_analytics_workspace_id    = "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.OperationalInsights/workspaces/{workspace-name}"
  log_analytics_workspace_name  = "my-log-analytics-workspace"
  log_analytics_workspace_retention_in_days = 30
  tags = {
    environment = "production"
    project     = "example"
  }
}
