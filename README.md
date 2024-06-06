# Appetizr - Sistemas de Información 23/24 - UNIZAR

This proyect mixes the concept of Tripadvisor, Uber Eats and Reddit implementing a complete web system in Ruby On Rails that allows users to browse nearby restaurants, review their dishes, interact with other users about common food-related topics, post in any of the discussion forums or comment about any restaurant or dish. As a restaurant owner you can list your restaurants and upload your menu and info, post as a restaurant owner and receive information on the interaction of users with your restaurants. As an extra we implemented the comunication process with another group in the class that developed the Uber Eats aspect to be able to order food and manage your orders. We provided them with comments about the restaurant and dishes, along with star reviews on each dish.

## DEPENDENCIES (for Ubuntu)
 - Postgres client

## INSTALL
Simly run the following

```
bundle install
```

For the API REST

```
cd api
source bin/activate{.<your_shell>}
pip install -r requirements.txt
```

## RUN SERVER

Declarar variables de entorno de la BD

```
source export_vars.sh
bin/rails server
```

## RUN WITH DOCKER

Building image from code

```
docker build \
  --build-arg DB_HOST=$POSTGRESQL_ADDON_HOST \
  --build-arg DB_USER=$POSTGRESQL_ADDON_USER \
  --build-arg DB_NAME=$POSTGRESQL_ADDON_DB \
  --build-arg DB_PASSWORD=$POSTGRESQL_ADDON_PASSWORD \
  --build-arg DB_PORT=$POSTGRESQL_ADDON_PORT \
  -t appetizr .

docker run --network host -d --name appetizr appetizr
```

Downloading image from DockerHub

```
docker pull atreidesii/appetizr
docker run --network host -d --name appetizr atreidesii/appetizr
```
