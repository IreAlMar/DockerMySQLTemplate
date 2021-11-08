# MySQL

* Connect to MySQL through container
  1. ``sudo docker exec -it dockerdatamodel_db_1 bash``
  2. ``mysql -u root -p``
* Connect to MySQL through host ``sudo mysql -u root -h 0.0.0.0 -p``

## Docker

* ``sudo docker-compose up --remove-orphans``
* ``sudo docker volume prune``
* ``sudo docker container prune``
* TODO: look for a way to remove volumes when shutting down container NOPE: To remove the created volumes: ``sudo docker-compose rm``

 
