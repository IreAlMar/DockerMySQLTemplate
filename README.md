#Postgres + PGAdmin containerized

* Start container from terminal ``sudo docker-compose up -d``

## PGAdmin

* Only Docker version is 4. Not possible to replace it with latest version 6.1.
#MySQL

* Connect to MySQL container``sudo docker exec -it dockerdatamodel_db_1 bash``
* ``mysql -u root -p``

## Docker

* ``sudo docker-compose up --remove-orphans``
* ``sudo docker volume prune``
* ``sudo docker container prune``
 
