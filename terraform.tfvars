subscription_id     = "dxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
tenant_id           = "9fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

location            = "gxxxxxxxxxxxxxx"
env                 = "dr"
site                = "pr"
purpose             = "qwerty-app"

vnet_address_space  = ["xxxxxxxxxxxxxxx"]

subnets = [
  {
    name             = "mgmt"
    address_prefixes = ["xxxxxxxxxxxxx"]
  },
  {
    name             = "app"
    address_prefixes = ["1xxxxxx"]
  },
  {
    name             = "db"
    address_prefixes = ["1xxxxxxxxxxxxxxxx]
  }
]

tags = {
  env   = "dr"
  owner = "platform"
}
