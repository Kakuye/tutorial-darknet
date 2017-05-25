# tutorial-darknet

NOTICE: the intent for this scripts are **not** to automatize but to **teach**
how to install a darknet server with i2p and possible TOR routers to vpn into from
external places. This is why **the script has no bash codin logic like if/for loops, file checks etc,
but is all line by line commands with out any logic/checks so students can follow step by step or 
even copy and paste manually**

Check at the end of a digital ocean coupon


1. create **Ubuntu server 16.10 x64** on **DigitalOcean** or AWS/RackSpace etc..
   This tutorial uses DigitalOcean.

2. Get your new IP and ssh into the server as root@${ip}
   ```
   ssh root@${YOURIP}
   ```

3. clone this repo
   ```
   git clone https://github.com/ChrisFernandez/tutorial-darknet.git
   ```
4. run 
   ```
      cd ~/tutorial-darknet
     ./packages.sh


5. EDIT the vars file you should have in this repo
   you only need to change settings in one place:
   look for:
   ```
     export KEY_COUNTRY="US"
     export KEY_PROVINCE="MA"
     export KEY_CITY="Boston"
     export KEY_ORG="BinaryFreedom"
     export KEY_EMAIL="rek2@binaryfreedom.info"
     export KEY_OU="OperationsLab"
   ```
   change to your own info...
   you will still be asked when next step this info and other info bsides.. just PRESS ENTER
   also you will be asked to add a password or not, to the cert created. up to you..
   if you do, everytime you add a user you have to add it..
   I recomend to learn just press "ENTER" to everything

   here is the example of when it ask for password and to sign the certificate
   ```
   Please enter the following 'extra' attributes
   to be sent with your certificate request
   A challenge password []:
   An optional company name []:
   Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf
   Check that the request matches the signature
   Signature ok
   The Subject's Distinguished Name is as follows
   countryName           :PRINTABLE:'US'
   stateOrProvinceName   :PRINTABLE:'MA'
   localityName          :PRINTABLE:'Boston'
   organizationName      :PRINTABLE:'BinaryFreedom'
   organizationalUnitName:PRINTABLE:'OperationsLab'
   commonName            :PRINTABLE:'server'
   name                  :PRINTABLE:'server'
   emailAddress          :IA5STRING:'rek2@binaryfreedom.info'
   Certificate is to be certified until May 23 00:54:01 2027 GMT (3650 days)
   Sign the certificate? [y/n]:Y


   1 out of 1 certificate requests certified, commit? [y/n]y
   ```



5. run
   ```
   cd ~/tutorial-darknet
   ./install-vpn.sh
   ```

6. now lets add a user to the vpn **you can reuse this script going forward to add friends or more accounts**
   run and edit client.ovpn since this is the client file that will go to your computer/laptop as client.
   ```
   vim /etc/openvpn/client.ovpn #change "remote XX.XX.XX.XX 1194" to your openvpn server, IP 1194
   ```
   Next step you have most of it configure so **NOTE** you have to press enter to continue and
   there are **2** promps to enter Y to sign the certificate with your CA and add a passwd if you like.
   ```
   cd ~/tutorial-darknet
   source /etc/openvpn/easy-
   ./create-user-openvpn.sh  name_of_user_account 
   ```

7. Now you should have a accountname.tar.gz on your local folder.. this is what you need to copy to your computer
   in your computer **install openvpn** and locally run:
   ```
   scp root@XX.XX.XX.XX:nameofuseraccount.tar.gz .
   sudo tar -zxvf nameofuseraccount.tar.gz -C /etc/openvpn/   #this is an example for ubuntu
   sudo tar -zxvf nameofuseraccount.tar.gz -C /etc/openvpn/client  #for Arch linux like Blackarch

   sudo mv /etc/openvpn/nameofuseraccount.ovpn /etc/nameofuseraccount.conf  #as exanple but RTFM for your distro
   sudo systemctl start openvpn  #ubuntu 
   ```
   now RTFM read the documentation in running openvpn client in your laptop/computer..

6. edit firewall.sh
   and change the line with port 22 and add your home IP so is not open to everyone
   **NOTE** if you change this to a diff ip to from you are ssh into the box you will get kick out!!!
   ```
   vim firewall.sh
   ./firewall.sh
   ufw enable
   ```


7. now we can go ahead and install i2pd
   ```
   ./install-i2p.sh
   ```

   and thats it for base install
   run a netstat to check everything that is a i2p server is running on the openvpn interface 10.8.0.1
   ```
   netstat -ln
   ```

8. configure **weechat** for irc on the server so you can vpn or ssh into it. and chat from there if dont want to use local client
   you have to change in all the file the entry "hispachati"

   ```
    cd ~/tutorial-darknet
    sed -i s/hispauser/whatevernick/g irc.conf
    ./install-weechat.sh
   ```
   ok thats it I recomend you run weechat under "screen" or similar program.
   That's it. you can run now weechat and it will auto connect to 10.8.0.1 port 6668
   it will auto connect to some channels like #hispagatos
   it may take a while since your i2p server is only running 1-2 hours or less..



Digital Ocean 10$ credit coupon!!!
```
Easily deploy an SSD cloud server on @DigitalOcean in 55 seconds. Sign up using my link and receive $10 in credit: https://m.do.co/t/96e575af1f05
```
