variable "subscription_id" {
  description = "Azure subscription ID to deploy into"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "location" {
  description = "Azure region, e.g., germanywestcentral"
  type        = string
}

variable "env" {
  description = "Environment short name, e.g., dr"
  type        = string
}

variable "site" {
  description = "Site or business unit code, e.g., pr"
  type        = string
}

variable "purpose" {
  description = "Purpose/Workload short code, e.g., qwerty-app"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    nsg_id           = optional(string)
    route_table_id   = optional(string)
    delegation       = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    }))
  }))
  default = []
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}