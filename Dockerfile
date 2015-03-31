# Creates distributed cdh5
# docker build -t jamesmo/cdh5 .

FROM myjre7_base:latest

MAINTAINER JamesMo <springclick@gmail.com>

USER root

# home
RUN mkdir -p /home/jamesmo

# tools
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl sudo supervisor

# install hadoop
RUN curl -O http://archive.cloudera.com/cdh5/one-click-install/wheezy/amd64/cdh5-repository_1.0_all.deb
RUN dpkg -i cdh5-repository_1.0_all.deb
RUN curl -s http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/archive.key | sudo apt-key add -
RUN apt-get update -y && apt-get install -y hadoop-hdfs-namenode hadoop-hdfs-datanode zookeeper zookeeper-server \
            hbase-master hbase-regionserver hive hive-hbase
