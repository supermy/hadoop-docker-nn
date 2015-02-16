# Creates distributed cdh5
#
# docker build -t bioshrek/hadoop-hdfs-datanode:cdh5 .

FROM bioshrek/hadoop-base:cdh5
MAINTAINER Huan Wang <shrekwang1@gmail.com>

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
