# terraform-vmware-bigip
bigip module for vmware vcenter


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
| terraform | ~> 0.14.0 |
| vsphere | ~> 1.23.0 |

## Providers

| Name | Version |
|------|---------|
| local | n/a |
| template | n/a |
| vsphere | ~> 1.23.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bigip\_admin\_password | vm admin pass | `any` | n/a | yes |
| bigip\_root\_password | vm root pass | `any` | n/a | yes |
| instances | instance configuration | `map` | `{}` | no |
| vsphere\_datacenter | vsphere datacenter where resources are deployed | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instances | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
