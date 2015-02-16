# Creates distributed cdh5
#
# docker build -t bioshrek/hadoop-hdfs-datanode:cdh5 .

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
RUN apt-get update -y && apt-get install -y hadoop-hdfs-datanode

# config hadoop
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hadoop
ADD pre-start-hadoop.sh /home/chianyu/pre-start-hadoop.sh
RUN chmod a+x /home/chianyu/pre-start-hadoop.sh
ENTRYPOINT /home/chianyu/pre-start-hadoop.sh && /usr/bin/supervisord

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030
