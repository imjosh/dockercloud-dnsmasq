#!/bin/bash

#modify a docker cloud container's /etc/resolv.conf to point at local dnsmasq caching server 

set -e 

DCLOUD_URI=`env | sed -n -e 's:^DOCKERCLOUD_CONTAINER_API_URI=.*\/\(.*\)\/:\1:p'`

echo search $DCLOUD_URI.local.dockerapp.io > /etc/resolv.conf
echo nameserver $DNSMASQ_PORT_53_TCP_ADDR >> /etc/resolv.conf
# additional nameservers in case the dnsmasq server fails
#echo nameserver 208.67.222.222 >> /etc/resolv.conf
#echo nameserver 208.67.220.220 >> /etc/resolv.conf

echo options ndots:1 ndots:0 >> /etc/resolv.conf

exec "$@"