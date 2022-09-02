# creates the network and run the dockers
docker-compose -f docker-compose.yml up -d

# to shut down the containers and the network
docker-compose -f docker-compose.yml down