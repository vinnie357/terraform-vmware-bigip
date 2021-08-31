# single device

## setup

```bash
cp admin.auto.tfvars.example admin.auto.tfvars
# MODIFY TO YOUR SETTINGS
. setup.sh
```

## cleanup
```bash
. cleanup.sh
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 2.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bigip"></a> [bigip](#module\_bigip) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [random_password.bigip_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [vsphere_folder.bigip](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/folder) | resource |
| [vsphere_folder.folder](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/folder) | resource |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigip_admin_password"></a> [bigip\_admin\_password](#input\_bigip\_admin\_password) | bigip web gui password | `string` | `""` | no |
| <a name="input_bigip_root_password"></a> [bigip\_root\_password](#input\_bigip\_root\_password) | bigip ssh password | `string` | `""` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | instance configuration | `map` | <pre>{<br>  "site": {<br>    "instance01": {<br>      "adminUserName": "admin",<br>      "as3Version": "3.22.1",<br>      "cfVersion": "1.5.0",<br>      "dnsServerList": "        \"192.168.2.251\",\n        \"8.8.8.8\"\n",<br>      "dnsSuffix": "domain.com",<br>      "doVersion": "1.15.0",<br>      "domain": "domain.com",<br>      "externalGateway": "192.168.1.254",<br>      "fastVersion": "1.4.0",<br>      "initVersion": "1.1.0",<br>      "interface1": "networkname",<br>      "interface2": "networkname",<br>      "interface3": "networkname",<br>      "interface4": "networkname",<br>      "internalGateway": "192.168.2.254",<br>      "license": "xxx-xxx",<br>      "mgmtIp": "192.168.20.54",<br>      "mgmt_gw": "192.168.20.254",<br>      "mgmt_netmask": "24",<br>      "name": "bigip-site",<br>      "ntpServerList": "        \"0.pool.ntp.org\",\n        \"1.pool.ntp.org\",\n        \"2.pool.ntp.org\"\n",<br>      "onboard_log": "/var/log/startup-script.log",<br>      "provisioning": "        \"avr\": \"none\",\n        \"ltm\": \"nominal\",\n        \"asm\": \"none\",\n        \"apm\": \"none\",\n        \"afm\": \"none\",\n        \"gtm\": \"none\"\n",<br>      "timeZone": "EDT",<br>      "tsVersion": "1.14.0",<br>      "vlanExternalInterface": "1.1",<br>      "vlanExternalIp": "192.168.1.54/24",<br>      "vlanExternalTag": "4094",<br>      "vlanExternalTagging": "true",<br>      "vlanHaInterface": "1.3",<br>      "vlanHaIp": "192.168.3.54/24",<br>      "vlanHaTag": "4092",<br>      "vlanHaTagging": "true",<br>      "vlanInternalInterface": "1.2",<br>      "vlanInternalIp": "192.168.2.54/24",<br>      "vlanInternalTag": "4093",<br>      "vlanInternalTagging": "true",<br>      "vm_datastoreName": "mydatastore",<br>      "vm_folderPath": "development/bigip/",<br>      "vm_linked_clone": false,<br>      "vm_template_bigip_name": "BIGIP-15.1.2-0.0.9.ALL2",<br>      "vm_vsphere_cluster": "mycomputecluster",<br>      "vm_vsphere_datacenter": "domain.com"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | vSphere datacenter | `any` | n/a | yes |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | vSphere folder where resources are created | `any` | n/a | yes |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | vSphere password | `any` | n/a | yes |
| <a name="input_vsphere_unverified_ssl"></a> [vsphere\_unverified\_ssl](#input\_vsphere\_unverified\_ssl) | Is the vCenter using a self signed certificate (true/false) | `string` | `"true"` | no |
| <a name="input_vsphere_user"></a> [vsphere\_user](#input\_vsphere\_user) | vSphere service account name ex: svc-terraform@domain.com | `any` | n/a | yes |
| <a name="input_vsphere_vcenter"></a> [vsphere\_vcenter](#input\_vsphere\_vcenter) | vCenter server FQDN or IP | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bigips"></a> [bigips](#output\_bigips) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
