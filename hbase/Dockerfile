# Creates distributed cdh5
#
# docker build -t jamesmo/hbase:cdh5 .

FROM jamesmo/cdh5:latest
MAINTAINER james mo <springclick@gmail.com>

RUN apt-get update -y && apt-get install -y \
            hbase-master hbase-regionserver hive hive-hbase
