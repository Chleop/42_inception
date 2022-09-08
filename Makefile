# creates the network and run the dockers
docker-compose -f docker-compose.yml up -d

# to shut down the containers and the network
docker-compose -f docker-compose.yml down

# to allow cproesch.42.fr as domain name (modify the etc/hosts file)
sudo chmod 666 /etc/hosts
echo "127.0.0.1 cproesch.42.fr" >> /etc/hosts
sudo chmod 644 /etc/hosts