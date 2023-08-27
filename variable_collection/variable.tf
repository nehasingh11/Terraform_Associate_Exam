variable "env" {
  type = map(any)
  default = {
    dev = {
      name = "vnet_dev"
      ip   = "10.0.0.0/16"
    }
    prod = {
      name = "vnet_prod"
      ip   = "10.1.0.0/16"
    }
  }

}