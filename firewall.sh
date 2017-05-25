ufw default deny
#ufw allow from XX.XX.XX.XX to any port 22 # change this and remove the port 22/ssh line that is open to everyone
ufw allow 22
ufw allow 12829
ufw allow 1194/udp
ufw allow from 10.8.0.0/24
