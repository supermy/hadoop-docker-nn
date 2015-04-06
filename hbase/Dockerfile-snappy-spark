# Creates distributed cdh5
#
# docker build -t jamesmo/hbase-snappy-spark:cdh5 .

FROM jamesmo/cdh5-snappy-spark:latest
MAINTAINER james mo <springclick@gmail.com>

RUN apt-get update -y && apt-get install -y \
            hbase-master hbase-regionserver hive hive-hbase
