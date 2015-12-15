# Creates distributed cdh5
#
# docker build -t supermy/cloud-hbase:snappy .

FROM supermy/cloud-cdh5:snappy
MAINTAINER james mo <springclick@gmail.com>

RUN apt-get install -y \
            hbase-master hbase-regionserver hive hive-hbase
