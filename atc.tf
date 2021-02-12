# f5 automation toolchain templates for onboarding
data "template_file" "do_json" {
  for_each = var.instances
  template = file("${path.module}/templates/do.json.tpl")
  vars = {
    local_host = "${each.value.name}-${each.value.vm_environment}.${each.value.domain}"
    #remote_host           = "${var.vm_name}-02-${var.vsphere_folder_env}.${var.vm_domain}"
    #remote_host_ip        = var.atc_config["bigip-02"].mgmtIp
    license               = each.value.license
    bigip_admin_password  = var.bigip_admin_password
    bigip_admin           = each.value.adminUserName
    dnsServer             = each.value.ntpServerList
    dnsSuffix             = each.value.domain
    ntpServer             = each.value.ntpServerList
    timezone              = each.value.timeZone
    vlanExternalInterface = each.value.vlanExternalInterface
    vlanExternalTagging   = each.value.vlanExternalTagging
    vlanExternalTag       = each.value.vlanExternalTag
    vlanExternalIp        = each.value.vlanExternalIp
    vlanInternalInterface = each.value.vlanInternalInterface
    vlanInternalTagging   = each.value.vlanInternalTagging
    vlanInternalTag       = each.value.vlanInternalTag
    vlanInternalIp        = each.value.vlanInternalIp
    vlanHaInterface       = each.value.vlanHaInterface
    vlanHaTagging         = each.value.vlanHaTagging
    vlanHaTag             = each.value.vlanHaTag
    vlanHaIp              = each.value.vlanHaIp
    externalGateway       = each.value.externalGateway
    internalGateway       = each.value.internalGateway
    provisioning          = each.value.provisioning
  }
}

data "template_file" "vm_onboard" {
  for_each = var.instances
  template = file("${path.module}/templates/runtime-init.sh.tpl")
  vars = {
    onboard_log = each.value.onboard_log
    DO_Document = data.template_file.do_json[each.key].rendered
    initVersion = each.value.initVersion
    doVersion   = each.value.doVersion
    as3Version  = each.value.as3Version
    tsVersion   = each.value.tsVersion
    cfVersion   = each.value.cfVersion
    fastVersion = each.value.fastVersion
  }
}

# onboard debug
resource "local_file" "onboard_file" {
  for_each = var.instances
  content  = data.template_file.vm_onboard[each.key].rendered
  filename = "${path.root}/onboard_${each.value.name}_01.sh"
}
resource "local_file" "do_file_01" {
  for_each = var.instances
  content  = data.template_file.do_json[each.key].rendered
  filename = "${path.root}/do_${each.value.name}_01.json"
}
