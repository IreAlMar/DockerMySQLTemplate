#Postgres + PGAdmin containerized

* Start container from terminal ``sudo docker-compose up -d``

## PGAdmin

* Only Docker version is 4. Not possible to replace it with latest version 6.1.
#MySQL

* Connect to MySQL through container
  1. ``sudo docker exec -it dockerdatamodel_db_1 bash``
  1.``mysql -u root -p``
* Connect to MySQL through host ``sudo mysql -u root -h 0.0.0.0 -p``

## Docker

* ``sudo docker-compose up --remove-orphans``
* ``sudo docker volume prune``
* ``sudo docker container prune``
* NOPE: To remove the created volumes: ``sudo docker-compose rm``

 
