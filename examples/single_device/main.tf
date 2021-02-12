# provider
provider "vsphere" {
  vsphere_server = var.vsphere_vcenter
  user           = var.vsphere_user
  password       = var.vsphere_password

  allow_unverified_ssl = var.vsphere_unverified_ssl
}
# vsphere
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}
resource "vsphere_folder" "folder" {
  path          = var.vsphere_folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_folder" "bigip" {
  depends_on    = [vsphere_folder.folder]
  path          = "${var.vsphere_folder}/bigip"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "random_password" "bigip_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
# creds
locals {
  bigip_admin_password = var.bigip_admin_password != "" ? var.bigip_admin_password : random_password.bigip_password.result
  bigip_root_password  = var.bigip_root_password != "" ? var.bigip_root_password : random_password.bigip_password.result
}
# bigips
module "bigip" {
  depends_on           = [vsphere_folder.bigip]
  source               = "../../"
  vsphere_datacenter   = data.vsphere_datacenter.dc.id
  instances            = var.instances["site"]
  bigip_admin_password = local.bigip_admin_password
  bigip_root_password  = local.bigip_root_password
}
