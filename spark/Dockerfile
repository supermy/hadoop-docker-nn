# Creates distributed cdh5
# http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cdh_ig_spark_configure.html
# docker build -t supermy/cloud-namenode:cdh5 .

FROM supermy/cloud-cdh5:latest
MAINTAINER JamesMo <springclick@gmail.com>

# config hadoop
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hadoop
ADD pre-start-hadoop.sh /home/jamesmo/pre-start-hadoop.sh
RUN chmod a+x /home/jamesmo/pre-start-hadoop.sh
ENTRYPOINT /home/jamesmo/pre-start-hadoop.sh && /usr/bin/supervisord


RUN apt-get update -y && apt-get install -y spark-core spark-master spark-worker spark-history-server spark-python

#EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030
