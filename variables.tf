variable "instances" {
  description = "instance configuration"
  default = {
  }
}
variable "vsphere_datacenter" {
  description = "vsphere datacenter where resources are deployed"
}
# bigip
variable "bigip_admin_password" {
  description = "vm admin pass"
}

variable "bigip_root_password" {
  description = "vm root pass"
}
