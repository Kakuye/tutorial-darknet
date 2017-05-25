#!/bin/bash


echo "make sure you source the vars file in your /etc/openvpn/easy-rsa/vars or . ./vars"
echo "Press enter to all promps since everything is already on your ./vars file loaded into the enviroment"

sleep 4


cd /etc/openvpn/easy-rsa/ #this is just in case
/etc/openvpn/easy-rsa/build-key $1


[[ -d /etc/openvpn/easy-rsa/users ]] || mkdir /etc/openvpn/easy-rsa/users

mkdir /etc/openvpn/easy-rsa/users/$1
cat /etc/openvpn/client.ovpn > /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "<ca>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/ca.crt >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</ca>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "<cert>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/$1.crt >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</cert>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "<key>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
cat /etc/openvpn/easy-rsa/keys/$1.key >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn
echo "</key>" >> /etc/openvpn/easy-rsa/users/$1/$1.ovpn

cd /etc/openvpn/easy-rsa/users/
tar -zcvf ~/$1.tar.gz -C /etc/openvpn/easy-rsa/users/$1 .
