#!/bin/bash

apt-get update
apt-get -y upgrade 
apt-get -y install openvpn easy-rsa
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf
cp server.conf /etc/openvpn/server.conf
echo 1 > /proc/sys/net/ipv4/ip_forward
cp sysctl.conf /etc/sysctl.conf
sysctl -p
cp ufw /etc/default/ufw
cp before.rules /etc/ufw/before.rules
cp -r /usr/share/easy-rsa/ /etc/openvpn/


sleep 1

cp vars /etc/openvpn/easy-rsa/vars
cp ~/tutorial-darknet/client.ovpn /etc/openvpn/
cd /etc/openvpn/easy-rsa/

. ./vars
source /etc/openvpn/easy-rsa/vars

/etc/openvpn/easy-rsa/clean-all

/etc/openvpn/easy-rsa/build-ca

/etc/openvpn/easy-rsa/build-key-server server


cp /etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt,ca.key} /etc/openvpn


echo "***THIS MAY TAKE A WHILE***"

sleep 1 

/etc/openvpn/easy-rsa/build-dh
/usr/sbin/openvpn --genkey --secret keys/ta.key

cp /etc/openvpn/easy-rsa/keys/{ta.key,dh2048.pem} /etc/openvpn
systemctl start openvpn@server
systemctl status openvpn@server
