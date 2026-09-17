
module "instance_provisioning" {
  source      = "../module"
  sgname      = var.sgname
  cidr        = var.cidr
  tag         = var.tag
  amiid       = var.amiid
  machinetype = var.machinetype
  keyname     = var.keyname
}