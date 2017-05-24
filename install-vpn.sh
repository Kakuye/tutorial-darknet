#!/bin/bash

apt-get update
apt-get install openvpn easy-rsa
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf
cp server.conf /etc/openvpn/server.conf
echo 1 > /proc/sys/net/ipv4/ip_forward
cp sysctl.conf /etc/sysctl.conf
cp ufw /etc/default/ufw
cp before.rules /etc/ufw/before.rules
cp -r /usr/share/easy-rsa/ /etc/openvpn/


sleep 1



cd /etc/openvpn/easy-rsa/
cp vars /etc/openvpn/easy-rsa/vars

source /etc/openvpn/easy-rsa/vars

/etc/openvpn/easy-rsa/clean-all

/etc/openvpn/easy-rsa/build-ca

/etc/openvpn/easy-rsa/build-key-server server


cp /etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt} /etc/openvpn

ls /etc/openvpn

service openvpn start

service openvpn status

service openvpn enable
