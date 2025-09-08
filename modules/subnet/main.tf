# Creates multiple subnets inside a VNet
resource "azurerm_subnet" "this" {
  for_each             = { for s in var.subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = try([each.value.delegation], [])
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}

# Optional associations if nsg_id or route_table_id provided
resource "azurerm_subnet_network_security_group_association" "nsg" {
  for_each                  = { for s in var.subnets : s.name => s if try(s.nsg_id, null) != null }
  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = each.value.nsg_id
}

resource "azurerm_subnet_route_table_association" "rt" {
  for_each        = { for s in var.subnets : s.name => s if try(s.route_table_id, null) != null }
  subnet_id       = azurerm_subnet.this[each.key].id
  route_table_id  = each.value.route_table_id
}