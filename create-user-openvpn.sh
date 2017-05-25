#!/bin/bash

/etc/openvpn/easy-rsa/build-key $1


[[ -d /etc/openvpn/easy-rsa/users ]] || mkdir /etc/openvpn/easy-rsa/users

mkdir /etc/openvpn/easy-rsa/users/$1
cat /etc/openvpn/easy-rsa/keys/client.ovpn > /etc/openvpn/easy-rsa/users/users/$1/$1.ovpn
echo "<ca>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/ca.crt >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</ca>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "<cert>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/$1.crt >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</cert>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "<key>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/$1.key >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</key>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
