output "instances" {
  value = vsphere_virtual_machine.instance[*]
}
