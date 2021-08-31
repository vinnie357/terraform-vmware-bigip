# terraform-vmware-bigip
bigip module for vmware vcenter

provides instances in vcenter and outputs templates for use with a pipeline,ansible or the f5 [vscode extension](https://marketplace.visualstudio.com/items?itemName=F5DevCentral.vscode-f5).

- f5 [declarative-onboarding](https://clouddocs.f5.com/products/extensions/f5-declarative-onboarding/latest/)
- f5 [bigip-runtime-init](https://github.com/F5Networks/f5-bigip-runtime-init)


examples:
- [single_device](./examples/single_device/readme.md)
- [two_devices](./examples/two_devices/readme.md)
# requirements
example ova:

[BIGIP-15.1.2-0.0.9](
https://downloads.f5.com/esd/serveDownload.jsp?path=/big-ip/big-ip_v15.x/15.1.2/english/15.1.2_virtual-edition/&sw=BIG-IP&pro=big-ip_v15.x&ver=15.1.2&container=15.1.2_Virtual-Edition&file=BIGIP-15.1.2-0.0.9.ALL-vmware.ova)

## prepare vsphere OVA template

https://techdocs.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-ve-setup-vmware-esxi-13-1-0/3.html

Login and delete the REST ID, SSH keys, etc. per the article : https://support.f5.com/csp/article/K44134742

```bash
rm -f /config/f5-rest-device-id
rm -f /config/ssh/ssh_host_*
rm -f /shared/ssh/ssh_host_*
rm -f /config/bigip.license
echo 'root:pleaseUseVault123!!' | chpasswd
echo 'admin:pleaseUseVault123!!' | chpasswd
cat > /root/.ssh/authorized_keys <<EOF
ssh-rsa ABGHS YOUR PUBLIC KEY HERE
EOF
shutdown -h now
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.5 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | ~> 2.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | ~> 2.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.do_file_01](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.onboard_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [vsphere_virtual_machine.instance](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [template_file.do_json](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.vm_onboard](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_network.network1](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_network.network2](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_network.network3](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_network.network4](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigip_admin_password"></a> [bigip\_admin\_password](#input\_bigip\_admin\_password) | vm admin pass | `any` | n/a | yes |
| <a name="input_bigip_root_password"></a> [bigip\_root\_password](#input\_bigip\_root\_password) | vm root pass | `any` | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | instance configuration | `map` | `{}` | no |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | vsphere datacenter where resources are deployed | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instances"></a> [instances](#output\_instances) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## development
```bash
# stage changes
git add .
#manual pre-commit test
pre-commit run -a -v
```
