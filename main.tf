locals {
  # Naming: cl-{site}-{purpose}-{env}-*
  prefix   = "cl-${var.site}-${var.purpose}-${var.env}"
  rg_name  = "${local.prefix}-rg"
  vnet_name = "${local.prefix}-vnet"

  # Subnet naming helper: cl-{site}-{purpose}-{env}-sn-{name}
  subnet_name = { for s in var.subnets : s.name => "cl-${var.site}-${var.purpose}-${var.env}-sn-${s.name}" }
}

module "rg" {
  source   = "./modules/resource_group"
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source              = "./modules/vnet"
  name                = local.vnet_name
  resource_group_name = module.rg.name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = var.tags
}

# Re-map subnets to inject standardized names
module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = module.rg.name
  vnet_name           = module.vnet.name
  subnets = [
    for s in var.subnets : merge(s, {
      name = local.subnet_name[s.name]
    })
  ]
  tags = var.tags
}