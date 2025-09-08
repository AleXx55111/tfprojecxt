subscription_id     = "d59a6260-2682-4085-a1dc-fb328c50acae"
tenant_id           = "9f7a36a6-53a9-4c4b-924d-7fcd85b5f921"

location            = "germanywestcentral"
env                 = "dr"
site                = "pr"
purpose             = "qwerty-app"

vnet_address_space  = ["10.10.0.0/16"]

subnets = [
  {
    name             = "mgmt"
    address_prefixes = ["10.10.0.0/24"]
  },
  {
    name             = "app"
    address_prefixes = ["10.10.1.0/24"]
  },
  {
    name             = "db"
    address_prefixes = ["10.10.2.0/24"]
  }
]

tags = {
  env   = "dr"
  owner = "platform"
}