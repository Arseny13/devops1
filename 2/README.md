# Docker
docker buildx  build -t my_postgres .
 #  - SecretsUsedInArgOrEnv: Do not use ARG or ENV instructions for sensitive data (ENV "POSTGRES_PASSWORD") (line 4)
docker run -d --name my_postgres_container -p 5433:5432  my_postgres

Another bash 
psql -h localhost -p 5433 -U myuser -d mydatabase # mypassword
\du

docker container stop id_container

# Docker-compose
sudo apt-get update
sudo apt-get install docker-compose-plugin
docker compose version

docker compose up -d 

Another bash 
psql -h localhost -p 5433 -U myuser -d mydatabase # mypassword
\du

docker compose down
docker volume rm $(docker volume ls -q)