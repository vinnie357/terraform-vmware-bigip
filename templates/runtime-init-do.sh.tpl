#!/bin/bash
# https://github.com/f5devcentral/f5-bigip-runtime-init
# vmware
#
# logging
LOG_FILE=${onboard_log}
if [ ! -e $LOG_FILE ]
then
     touch $LOG_FILE
     exec &>>$LOG_FILE
else
    #if file exists, exit as only want to run once
    exit 0
fi
exec 1>$LOG_FILE 2>&1
# wait bigip
source /usr/lib/bigstart/bigip-ready-functions
wait_bigip_ready
# tmos init
# configure
mkdir -p /config/cloud
# https://github.com/f5devcentral/f5-bigip-runtime-init/blob/develop/src/schema/base_schema.json
cat  <<EOF > /config/cloud/cloud_config.yaml
---
pre_onboard_enabled:
  - name: provision_rest
    type: inline
    commands:
      - /usr/bin/setdb provision.extramb 500
      - /usr/bin/setdb restjavad.useextramb true
      - /usr/bin/setdb setup.run false
  - name: expand_rest_storage
    type: inline
    commands:
      - /bin/tmsh modify /sys disk directory /appdata new-size 52256768
      - /bin/tmsh save sys config
extension_packages:
  install_operations:
    - extensionType: do
      extensionVersion: ${doVersion}
    - extensionType: as3
      extensionVersion: ${as3Version}
    - extensionType: ts
      extensionVersion: ${tsVersion}
extension_services:
  service_operations:
    - extensionType: do
      type: inline
      value: ${DO_Document}
EOF
# # Download
# initVersion="${initVersion}"
# PACKAGE_URL="https://cdn.f5.com/product/cloudsolutions/f5-bigip-runtime-init/v$${initVersion}/dist/f5-bigip-runtime-init-$${initVersion}-1.gz.run"
# for i in {1..30}; do
#     curl -fv --retry 1 --connect-timeout 5 -L "$${PACKAGE_URL}" -o "/var/config/rest/downloads/$${PACKAGE_URL##*/}" && break || sleep 10
# done
# # Install
# bash /var/config/rest/downloads/f5-bigip-runtime-init-$${initVersion}-1.gz.run -- '--cloud azure'
# install run-time-init

initVersion="${initVersion}"
curl -o /tmp/f5-bigip-runtime-init-$${initVersion}-1.gz.run https://cdn.f5.com/product/cloudsolutions/f5-bigip-runtime-init/v$${initVersion}/dist/f5-bigip-runtime-init-$${initVersion}-1.gz.run && bash /tmp/f5-bigip-runtime-init-$${initVersion}-1.gz.run -- '--cloud all'
# debug
# error,warn,info,debug,silly
export F5_BIGIP_RUNTIME_INIT_LOG_LEVEL=debug
# run
wait_bigip_ready
echo "---- running run-time-init ----"
f5-bigip-runtime-init --config-file /config/cloud/cloud_config.yaml
wait_bigip_ready
echo "==== Done ===="
exit 0
