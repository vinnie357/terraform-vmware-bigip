#vcenter
variable "vsphere_user" {
  description = "vSphere service account name ex: svc-terraform@domain.com"
}
variable "vsphere_password" {
  description = "vSphere password"
}
variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}
variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
  default     = "true"
}
variable "vsphere_folder" {
  description = "vSphere folder where resources are created"
}
# bigip credentials
variable "bigip_admin_password" {
  description = "bigip web gui password"
  default     = ""
}
variable "bigip_root_password" {
  description = "bigip ssh password"
  default     = ""
}
# instances
variable "instances" {
  description = "instance configuration"
  default = {
    site = {
      instance01 = {
        # vcenter
        vm_vsphere_datacenter  = "domain.com"
        vm_vsphere_cluster     = "mycomputecluster"
        vm_datastoreName       = "mydatastore"
        vm_folderPath          = "development/bigip/"
        vm_template_bigip_name = "BIGIP-15.1.2-0.0.9.ALL2"
        vm_linked_clone        = false
        # instance
        name         = "bigip-site"
        domain       = "domain.com"
        mgmtIp       = "192.168.20.54"
        mgmt_netmask = "24"
        mgmt_gw      = "192.168.20.254"
        # networks/interfaces
        interface1 = "networkname"
        interface2 = "networkname"
        interface3 = "networkname"
        interface4 = "networkname"
        # atc
        initVersion = "1.1.0"
        doVersion   = "1.15.0"
        as3Version  = "3.22.1"
        tsVersion   = "1.14.0"
        cfVersion   = "1.5.0"
        fastVersion = "1.4.0"
        # none,minimal,nominal,dedicated
        provisioning = <<EOF
        "avr": "none",
        "ltm": "nominal",
        "asm": "none",
        "apm": "none",
        "afm": "none",
        "gtm": "none"
        EOF
        # bigip onboarding
        onboard_log           = "/var/log/startup-script.log"
        license               = "xxx-xxx"
        adminUserName         = "admin"
        dnsServerList         = <<EOF
        "192.168.2.251",
        "8.8.8.8"
        EOF
        dnsSuffix             = "domain.com"
        ntpServerList         = <<EOF
        "0.pool.ntp.org",
        "1.pool.ntp.org",
        "2.pool.ntp.org"
        EOF
        timeZone              = "EDT"
        vlanExternalInterface = "1.1"
        vlanExternalTagging   = "true"
        vlanExternalTag       = "4094"
        vlanExternalIp        = "192.168.1.54/24"
        vlanInternalInterface = "1.2"
        vlanInternalTagging   = "true"
        vlanInternalTag       = "4093"
        vlanInternalIp        = "192.168.2.54/24"
        vlanHaInterface       = "1.3"
        vlanHaTagging         = "true"
        vlanHaTag             = "4092"
        vlanHaIp              = "192.168.3.54/24"
        externalGateway       = "192.168.1.254"
        internalGateway       = "192.168.2.254"
      }
    }
  }
}
