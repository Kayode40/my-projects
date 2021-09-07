resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name

  # azure will assign the id automatically
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = "system"
    node_count           = var.system_node_count
    vm_size              = "Standard_DS2_v2"
	type                = "VirtualMachineScaleSets"
	min_count           = 2
	max_count           = 5
	enable_auto_scaling = true
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet" # CNI
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_role_assignment" "role_acrpull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

data "azurerm_storage_account" "datastore" {
  name                 = "serverkay"
  resource_group_name  = "KAYODE"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "KAYODE"
    storage_account_name = "serverkay"
    container_name       = "terra"
    key                  = "k8.tfstate"
  }
}