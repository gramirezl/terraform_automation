resource "azurerm_kubernetes_cluster" "aks" {
  name                = "omicron_aks_uat"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "omicron-aks-uat-dns"

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
    vnet_subnet_id      = azurerm_subnet.subnetdefault.id
  }

  network_profile {
    network_plugin = "azure"
  }

    identity {
    type = "SystemAssigned"
  }
}