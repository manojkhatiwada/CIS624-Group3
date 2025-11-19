output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "owners_tag" {
  value       = join(", ", var.owners)
  description = "Comma-separated list of owners included in the owners tag"
}
