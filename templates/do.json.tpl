{
    "schemaVersion": "1.0.0",
    "class": "Device",
    "async": true,
    "label": "Onboard BIG-IP Standalone BYOL",
    "Common": {
        "class": "Tenant",
        "hostname": "${local_host}",
        "dbVars": {
            "class": "DbVariables",
            "ui.advisory.enabled": true,
            "ui.advisory.color": "green",
            "ui.advisory.text": "/Common/hostname",
            "config.allow.rfc3927": "enable"
        },
        "myLicense": {
            "class": "License",
            "licenseType": "regKey",
            "regKey": "${license}"
        },
        "myDns": {
            "class": "DNS",
            "nameServers": [
              ${dnsServer}
            ],
            "search": [
                "${dnsSuffix}"
            ]
        },
        "myNtp": {
            "class": "NTP",
            "servers": [
              ${ntpServer}
            ],
            "timezone": "${timezone}"
        },
        "myProvisioning": {
            "class": "Provision",
            ${provisioning}
        },
        "external": {
            "class": "VLAN",
            "tag": ${vlanExternalTag},
            "mtu": 1500,
            "interfaces": [
                {
                    "name": "${vlanExternalInterface}",
                    "tagged": ${vlanExternalTagging}
                }
            ]
        },
        "internal": {
            "class": "VLAN",
            "tag": ${vlanInternalTag},
            "mtu": 1500,
            "interfaces": [
                {
                    "name": "${vlanInternalInterface}",
                    "tagged": ${vlanInternalTagging}
                }
            ]
        },
        "ha": {
            "class": "VLAN",
            "tag": ${vlanHaTag},
            "mtu": 1500,
            "interfaces": [
                {
                    "name": "${vlanHaInterface}",
                    "tagged": ${vlanHaTagging}
                }
            ]
        },
        "external-self": {
            "class": "SelfIp",
            "address": "${vlanExternalIp}",
            "vlan": "external",
            "allowService": "none",
            "trafficGroup": "traffic-group-local-only"
        },
        "internal-self": {
            "class": "SelfIp",
            "address": "${vlanInternalIp}",
            "vlan": "internal",
            "allowService": "none",
            "trafficGroup": "traffic-group-local-only"
        },
        "ha-self": {
            "class": "SelfIp",
            "address": "${vlanHaIp}",
            "vlan": "ha",
            "allowService": "default",
            "trafficGroup": "traffic-group-local-only"
        },
        "default_gw": {
            "class": "Route",
            "gw": "${externalGateway}",
            "network": "default",
            "mtu": 1500
        }
    }
}
