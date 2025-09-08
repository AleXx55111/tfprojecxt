variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnets" {
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
}

variable "tags" {
  type    = map(string)
  default = {}
}