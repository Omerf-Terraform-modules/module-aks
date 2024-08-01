variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the AKS cluster will be created"
  type        = string
}

variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "dns_prefix_private_cluster" {
  description = "The Private DNS prefix for the AKS cluster"
  type        = string
}

variable "default_node_pool" {
  description = "Default node pool configuration"
  type = object({
    name            = string
    node_count      = number
    vm_size         = string
    os_disk_size_gb = number
    vnet_subnet_id  = string
  })
}

variable "network_plugin" {
  description = "Network plugin to use for networking"
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "The SKU of the load balancer to use"
  type        = string
  default     = "standard"
}

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone to use for the private cluster."
  type        = string
  default     = ""
}

variable "identity_ids" {
  description = "List of identity ids to assign to the created aks"
  type        = list(string)
}

variable "enable_monitoring" {
  description = "Enable monitoring for the AKS cluster"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_retention_in_days" {
  description = "The retention period in days for the Log Analytics workspace"
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
