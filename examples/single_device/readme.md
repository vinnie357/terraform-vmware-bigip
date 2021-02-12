# single device
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| random | n/a |
| vsphere | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bigip\_admin\_password | bigip web gui password | `string` | `""` | no |
| bigip\_root\_password | bigip ssh password | `string` | `""` | no |
| instances | instance configuration | `map` | <pre>{<br>  "site": {<br>    "instance01": {<br>      "adminUserName": "admin",<br>      "as3Version": "3.22.1",<br>      "cfVersion": "1.5.0",<br>      "dnsServerList": "        \"192.168.2.251\",\n        \"8.8.8.8\"\n",<br>      "dnsSuffix": "domain.com",<br>      "doVersion": "1.15.0",<br>      "domain": "domain.com",<br>      "externalGateway": "192.168.1.254",<br>      "fastVersion": "1.4.0",<br>      "initVersion": "1.1.0",<br>      "interface1": "networkname",<br>      "interface2": "networkname",<br>      "interface3": "networkname",<br>      "interface4": "networkname",<br>      "internalGateway": "192.168.2.254",<br>      "license": "xxx-xxx",<br>      "mgmtIp": "192.168.20.54",<br>      "mgmt_gw": "192.168.20.254",<br>      "mgmt_netmask": "24",<br>      "name": "bigip-site",<br>      "ntpServerList": "        \"0.pool.ntp.org\",\n        \"1.pool.ntp.org\",\n        \"2.pool.ntp.org\"\n",<br>      "onboard_log": "/var/log/startup-script.log",<br>      "provisioning": "        \"avr\": \"none\",\n        \"ltm\": \"nominal\",\n        \"asm\": \"none\",\n        \"apm\": \"none\",\n        \"afm\": \"none\",\n        \"gtm\": \"none\"\n",<br>      "timeZone": "EDT",<br>      "tsVersion": "1.14.0",<br>      "vlanExternalInterface": "1.1",<br>      "vlanExternalIp": "192.168.1.54/24",<br>      "vlanExternalTag": "4094",<br>      "vlanExternalTagging": "true",<br>      "vlanHaInterface": "1.3",<br>      "vlanHaIp": "192.168.3.54/24",<br>      "vlanHaTag": "4092",<br>      "vlanHaTagging": "true",<br>      "vlanInternalInterface": "1.2",<br>      "vlanInternalIp": "192.168.2.54/24",<br>      "vlanInternalTag": "4093",<br>      "vlanInternalTagging": "true",<br>      "vm_datastoreName": "mydatastore",<br>      "vm_folderPath": "development/bigip/",<br>      "vm_linked_clone": false,<br>      "vm_template_bigip_name": "BIGIP-15.1.2-0.0.9.ALL2",<br>      "vm_vsphere_cluster": "mycomputecluster",<br>      "vm_vsphere_datacenter": "domain.com"<br>    }<br>  }<br>}</pre> | no |
| vsphere\_datacenter | vSphere datacenter | `any` | n/a | yes |
| vsphere\_folder | vSphere folder where resources are created | `any` | n/a | yes |
| vsphere\_password | vSphere password | `any` | n/a | yes |
| vsphere\_unverified\_ssl | Is the vCenter using a self signed certificate (true/false) | `string` | `"true"` | no |
| vsphere\_user | vSphere service account name ex: svc-terraform@domain.com | `any` | n/a | yes |
| vsphere\_vcenter | vCenter server FQDN or IP | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bigips | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
