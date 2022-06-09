#!/bin/bash
esxcli system syslog config set --loghost=udp://10.255.0.34:1514
echo -e "<ConfigRoot>\n<service>\n<id>graylog</id>\n<rule id='0000'>\n<direction>outbound</direction>\n<protocol>udp</protocol>\n<porttype>dst</porttype>\n<port>1514</port>\n</rule>\n</service>\n</ConfigRoot>" > /etc/vmware/firewall/graylog.xml
esxcli network firewall refresh
esxcli network firewall ruleset set --ruleset-id=graylog --enabled=true
esxcli network firewall refresh
esxcli network firewall unload
esxcli network firewall load
esxcli network firewall refresh