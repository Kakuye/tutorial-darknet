sudo add-apt-repository ppa:purplei2p/i2pd
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install i2pd

cp i2pd.conf /etc/i2pd/i2pd.conf
cp tunnels.conf /etc/i2pd/tunnels.conf

sudo systemctl restart i2pd
sudo systemctl status i2pd
