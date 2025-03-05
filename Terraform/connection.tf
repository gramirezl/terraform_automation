resource "azurerm_local_network_gateway" "localgateway" {
  name                = "test-local-gateway-uat"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  gateway_fqdn        = "monterrey-nrzhqvhnqh.dynamic-m.com"
  address_space       = ["172.30.5.128/25","172.30.5.16/28","172.30.5.48/28","172.30.5.64/28","172.30.5.80/30","172.30.7.0/24","172.30.8.0/23","192.168.10.0/24"]
}

resource "azurerm_public_ip" "gpublicip" {
  name                = "test-gateway-ip-uat"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_virtual_network_gateway" "vnetgateway" {
  name                = "test-uat-gateway"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.gpublicip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnetgateway.id
  }
}

resource "azurerm_virtual_network_gateway_connection" "vngc" {
  name                = "test-S2S-uat"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  type                       = "IPsec"
  connection_protocol        = "IKEv1"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vnetgateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.localgateway.id

  shared_key = "testlab.123"
}