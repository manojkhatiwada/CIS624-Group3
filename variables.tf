variable "owners" {
  description = "List of team members (and teacher) to put in the owners tag."
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-team-project"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "manoj-notes-replace-me"
}


variable "location" {
  description = "Azure region"
  type        = string
  default     = "northcentralus"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-team-project"
}

variable "vnet_address_space" {
  description = "Address space for the vnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-vm"
}

variable "subnet_prefix" {
  description = "Subnet CIDR within the vnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "nic_name" {
  description = "Network interface card name"
  type        = string
  default     = "nic-vm"
}

variable "common_tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {
    project = "team-project"
    owner   = "team"
  }
}
