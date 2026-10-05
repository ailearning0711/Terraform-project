module "instance_provisioning" {
  source            = "../module"
  sgname            = var.sgname
  mytag             = var.mytag
  amiid             = var.amiid
  machinetype       = var.machinetype
  keyname           = var.keyname
  cidr              = var.cidr
  bucket_name       = var.bucket_name
}
