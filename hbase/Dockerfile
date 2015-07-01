# Creates distributed cdh5
#
# docker build -t supermy/cloud-hbase:cdh5 .

FROM supermy/cloud-cdh5:latest
MAINTAINER james mo <springclick@gmail.com>

RUN apt-get update -y && apt-get install -y \
            hbase-master hbase-regionserver hive hive-hbase \
            hive-metastore  mysql-client libmysql-java

RUN ln -s /usr/share/java/libmysql-java.jar /usr/lib/hive/lib/libmysql-java.jar

#$ mysql -u root -p
#Enter password:
#mysql> CREATE DATABASE metastore;
#mysql> USE metastore;
#mysql> SOURCE /usr/lib/hive/scripts/metastore/upgrade/mysql/hive-schema-0.12.0.mysql.sql;

#hive-server2

#/usr/lib/hive/conf/hive-site.xml
#sudo service hive-metastore start