# tutorial-darknet



1. create *Ubuntu server 16.10 x64* on *DigitalOcean* or AWS/RackSpace etc..
   This tutorial uses DigitalOcean.

2. Get your new IP and ssh into the server as root@${ip}

3. clone this repo
   https://github.com/ChrisFernandez/tutorial-darknet.git

4. run 
   ```
      cd tutorial-darknet
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


