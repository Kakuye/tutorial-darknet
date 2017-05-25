# tutorial-darknet



1. create Ubuntu server 16.10 x64 on DigitalOcean or AWS/RackSpace etc..
   This tutorial uses DigitalOcean.

2. Get your new IP and ssh into the server as root@

3. clone this repo
   https://github.com/ChrisFernandez/tutorial-darknet.git

4. run ./packages.sh


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

5. run ./install-vpn.sh


