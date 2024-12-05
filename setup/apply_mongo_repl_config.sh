sudo cp mongod.conf /etc/mongod.conf
cp ../back/keys/jaguarcrypto.kf /home/netwood
sudo chmod 400 /home/netwood/jaguarcrypto.kf
sudo chown mongodb:mongodb /home/netwood/jaguarcrypto.kf