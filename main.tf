data "vsphere_virtual_machine" "template" {
  for_each      = var.instances
  name          = each.value.vm_template_bigip_name
  datacenter_id = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  for_each      = var.instances
  name          = each.value.vm_vsphere_cluster
  datacenter_id = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
  for_each      = var.instances
  name          = each.value.vm_datastoreName
  datacenter_id = var.vsphere_datacenter
}
data "vsphere_network" "network1" {
  for_each      = var.instances
  name          = each.value.interface1
  datacenter_id = var.vsphere_datacenter
}
data "vsphere_network" "network2" {
  for_each      = var.instances
  name          = each.value.interface2
  datacenter_id = var.vsphere_datacenter
}
data "vsphere_network" "network3" {
  for_each      = var.instances
  name          = each.value.interface3
  datacenter_id = var.vsphere_datacenter
}
data "vsphere_network" "network4" {
  for_each      = var.instances
  name          = each.value.interface4
  datacenter_id = var.vsphere_datacenter
}

resource "vsphere_virtual_machine" "instance" {
  for_each         = var.instances
  name             = "${each.value.name}-${each.value.vm_environment}.${each.value.domain}"
  resource_pool_id = data.vsphere_compute_cluster.cluster[each.key].resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore[each.key].id
  folder           = each.value.vm_folderPath
  // tags             = [vsphere_tag.Application.id, var.vm_tags_environment]

  num_cpus = each.value.cpu
  memory   = each.value.memory
  guest_id = data.vsphere_virtual_machine.template[each.key].guest_id

  scsi_type = data.vsphere_virtual_machine.template[each.key].scsi_type

  network_interface {
    network_id   = data.vsphere_network.network1[each.key].id
    adapter_type = data.vsphere_virtual_machine.template[each.key].network_interface_types[0]
  }
  network_interface {
    network_id   = data.vsphere_network.network2[each.key].id
    adapter_type = data.vsphere_virtual_machine.template[each.key].network_interface_types[0]
  }
  network_interface {
    network_id   = data.vsphere_network.network3[each.key].id
    adapter_type = data.vsphere_virtual_machine.template[each.key].network_interface_types[0]
  }
  network_interface {
    network_id   = data.vsphere_network.network4[each.key].id
    adapter_type = data.vsphere_virtual_machine.template[each.key].network_interface_types[0]
  }
  disk {
    label            = "${each.value.name}0.vmdk"
    size             = each.value.diskSize != "" ? each.value.diskSize : data.vsphere_virtual_machine.template[each.key].disks.0.size
    eagerly_scrub    = each.value.diskScrubbing != "" ? each.value.diskScrubbing : data.vsphere_virtual_machine.template[each.key].disks.0.eagerly_scrub
    thin_provisioned = each.value.diskProvisioning != "" ? each.value.diskProvisioning : data.vsphere_virtual_machine.template[each.key].disks.0.thin_provisioned
  }
  cdrom {
    client_device = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template[each.key].id
    linked_clone  = each.value.vm_linked_clone
    customize {
      // weird provider behavior where customization works but fails instantly waiting on vmtools.
      timeout = -1
      linux_options {
        host_name = "${each.value.name}-${each.value.vm_environment}"
        domain    = each.value.domain
      }

      network_interface {
        ipv4_address = each.value.mgmtIp
        ipv4_netmask = each.value.mgmt_netmask
      }
      network_interface {}
      network_interface {}
      network_interface {}
      dns_server_list = [each.value.vm_dns_server_list]
      ipv4_gateway    = each.value.mgmt_gw
    }
  }

}
