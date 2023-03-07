#!/bin/bash

# Extract named config and store in file
named-checkconf -px > config_dump.txt
ip --json --brief addr show > ipconfig.json
ip --json --brief route show > iproute.json
ip addr show > ipaddr.txt
ip route > iproute.txt
hostname -A > hostname.txt

tar --remove-files -zcvf config_dump_`hostname`.tar.gz \
  config_dump.txt \
  ipaddr.txt \
  iproute.txt \
  ipconfig.json \
  iproute.json \
  hostname.txt
