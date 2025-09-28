# Hadoop-Hive-Spark cluster + Jupyter on Docker

## Software

* [Hadoop 3.3.6](https://hadoop.apache.org/)

* [Hive 3.1.3](http://hive.apache.org/)

* [Spark 3.3.1](https://spark.apache.org/)

## Quick Start

To deploy the cluster, run:
```
make
docker-compose up
```

## Access interfaces with the following URL

### Hadoop

ResourceManager: http://localhost:8088

NameNode: http://localhost:9870

HistoryServer: http://localhost:19888

Datanode1: http://localhost:9864

Datanode2: http://localhost:9865

Datanode3: http://localhost:9866

NodeManager1: http://localhost:8042

NodeManager2: http://localhost:8043

NodeManager3: http://localhost:8044

### Spark

master: http://localhost:8080

worker1: http://localhost:8081

worker2: http://localhost:8082

worker3: http://localhost:8083

history: http://localhost:18080

spark master: spark://172.28.1.2:7077 

### Hive

URI: jdbc:hive2://localhost:10000