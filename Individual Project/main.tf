terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

# Manoj Notes - Grab the Subscription Id from your Azure account and replace here

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id 
}

# Manoj Notes - This section is for Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = merge(
    var.common_tags,
    {
      owners = join(", ", var.owners)
    }
  )
}

# Manoj Notes - This section is for Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = merge(
    var.common_tags,
    {
      owners = join(", ", var.owners)
    }
  )
}

# Manoj Notes - This section is Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
}

# Manoj Notes - This section is for Network Interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = merge(
    var.common_tags,
    {
      owners = join(", ", var.owners)
    }
  )
}
