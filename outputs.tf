output "id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "The Kubernetes config"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "kube_admin_config" {
  description = "The Kubernetes admin config"
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "fqdn" {
  description = "The FQDN of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "kubelet_identity_object_id" {
  description = "The Kubelet identity object of the AKS cluster"
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}