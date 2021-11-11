# CSVKit

[csvkit](https://csvkit.readthedocs.io/en/latest/scripts/csvsql.html#)

## Docker 

Handy commands
* ``sudo docker build -t csvkit-pilot .``
* ``sudo docker-compose -f docker-compose-csvkit.yml up``
* ``sudo docker stop dockerdatamodel_csvkit_1``
* ``sudo docker exec -it dockerdatamodel_csvkit_1 bash``

## Useful commands

* ``head -1 file.csv | tr -d '"'``