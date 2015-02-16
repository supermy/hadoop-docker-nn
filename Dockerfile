# Creates distributed cdh5
#
# docker build -t bioshrek/hadoop-hdfs-namenode:cdh5 .

FROM ubuntu:12.04
MAINTAINER Huan Wang <shrekwang1@gmail.com>

USER root

# home
RUN mkdir -p /home/chianyu

# tools
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl sudo supervisor

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accepmt-securebackup-cookie'
RUN tar vxfz jdk-7u67-linux-x64.tar.gz -C /home/chianyu/
RUN rm jdk-7u67-linux-x64.tar.gz

ENV JAVA_HOME /home/chianyu/jdk1.7.0_67
ENV PATH $PATH:$JAVA_HOME/bin

# install hadoop
RUN curl -O http://archive.cloudera.com/cdh5/one-click-install/precise/amd64/cdh5-repository_1.0_all.deb 
RUN dpkg -i cdh5-repository_1.0_all.deb
RUN curl -s http://archive.cloudera.com/cdh5/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
RUN apt-get update -y && apt-get install -y hadoop-hdfs-namenode hadoop-hdfs-datanode zookeeper zookeeper-server hbase-master hbase-regionserver
