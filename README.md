# DB Migration tool

## csvkit container

This container uses the [csvkit](https://csvkit.readthedocs.io/en/latest/scripts/csvsql.html#) library to extract the column info from csv files. 

When starting the container Docker will execute ``csvKitScript.sh``. This script reads one by one the files in ``cssvData`` and processes them:
1. Read the csv file to extract the column names
2. Infer the data types for each column
3. Create the sql sentence for the creation of the table
4. Add the sql sentence for the infile data load

### Docker

Instructions to operate with the container:

1. Build the container image: ``sudo docker build -t csvkit-tool .``
2. Start the container: ``sudo docker-compose -f docker-compose-csvkit.yml up``
3. Stop container: ``sudo docker stop dockerdatamodel_csvkit_1``
4. Access a bash console inside the container: ``sudo docker exec -it dockerdatamodel_csvkit_1 bash``


## MySQL container

The MySQL container starts a MySQL DB. Only the first time the container is started will it execute the init scripts in the ``infileLoadScripts`` directory.

* Connect to MySQL through container
  1. ``sudo docker exec -it dockerdatamodel_db_1 bash``
  2. ``mysql -u root -p``
* Connect to MySQL through host ``sudo mysql -u root -h 0.0.0.0 -p``

MySQL has issues with column names that include dots ``.``, solved it by including back ticks in the infile load data sentence

### Docker

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

## Notes

* -- USE testRubicon; -> the MySQL container creates and operates over the ``testRubicon`` DB as it is configured in the environment of the docker-compose file.

* -- SET GLOBAL local_infile='ON'; -> set in the custom config file.

* sql_mode="" -> MySQL does not have built-in Boolean type. By default, MySQL BOOLEAN data type is an integer, zero is considered as false, and non-zero value is considered as true. Override the config file to let it accept non integer values as boolean.

* ``RUN`` vs ``CMD`` in Dockerfile
  * ``RUN`` is an image build step, the state of the container after a ``RUN`` command will be committed to the container image. A Dockerfile can have many ``RUN`` steps that layer on top of one another to build the image.
  * ``CMD`` is the command the container executes by default when you launch the built image. A Dockerfile will only use the final ``CMD`` defined. 
