# Migration tool

## MySQL

* Connect to MySQL through container
  1. ``sudo docker exec -it dockerdatamodel_db_1 bash``
  2. ``mysql -u root -p``
* Connect to MySQL through host ``sudo mysql -u root -h 0.0.0.0 -p``

### Docker

Handy commands

* Start container 
  * ``-V, --renew-anon-volumes``: Recreate anonymous volumes instead of retrieving data from the previous containers.
  * ``--remove-orphans``: Remove containers for services not defined in the Compose file
  * ``docker-compose -f docker-compose-mysql.yml up --renew-anon-volumes --remove-orphans``
* Stop container
  * ``-v, --volumes`:  Remove named volumes declared in the `volumes` section of the Compose file and anonymous volumes attached to containers.``
  * ``sudo docker-compose -f docker-compose-mysql.yml down --volumes``
* Remove unused components
  * ``sudo docker volume prune``
  * ``sudo docker container prune``

### Notes

-- USE testRubicon;

-- SET GLOBAL local_infile='ON';

## csvkit

[csvkit](https://csvkit.readthedocs.io/en/latest/scripts/csvsql.html#)

### Docker

Handy commands

* ``sudo docker build -t csvkit-tool .``
* ``sudo docker-compose -f docker-compose-csvkit.yml up``
* ``sudo docker stop dockerdatamodel_csvkit_1``
* ``sudo docker exec -it dockerdatamodel_csvkit_1 bash``

## Other info

### Useful commands

* ``head -1 file.csv | tr -d '"'``

### Dockerfile

* ``RUN`` vs ``CMD``
  * ``RUN`` is an image build step, the state of the container after a RUN command will be committed to the container image. A Dockerfile can have many RUN steps that layer on top of one another to build the image.
  * ``CMD`` is the command the container executes by default when you launch the built image. A Dockerfile will only use the final ``CMD` defined. The ``CMD`` can be overridden when starting a container with.


## TODO

* Solve permission issues with sqlScrips dir