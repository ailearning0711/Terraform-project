
module "instance_provisioning" {
  source = "git::https://github.com/ailearning0711/terraform-module.git"
  sgname      = var.sgname
  cidr        = var.cidr
  mytag       = var.mytag
  amiid       = var.amiid
  machinetype = var.machinetype
  keyname     = var.keyname
  device_name = var.device_name
  volume      = var.volume
  ebs_size    = var.ebs_size
  ebs_type    = var.ebs_type
}