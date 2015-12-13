# Creates distributed cdh5
#
# docker build -t supermy/cloud-namenode:cdh5 .

FROM supermy/cloud-cdh5:snappy
MAINTAINER JamesMo <springclick@gmail.com>

# config hadoop
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml

# config yarn
ADD yarn-site.xml /etc/hadoop/conf/yarn-site.xml
ADD mapred-site.xml /etc/hadoop/conf/mapred-site.xml
#ADD fair-scheduler.xml /etc/hadoop/conf/fair-scheduler.xml


# yarn
RUN apt-get install -y \
            hadoop-yarn hadoop-yarn-resourcemanager  \
            hadoop-mapreduce-historyserver hadoop-yarn-proxyserver


# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hadoop
ADD pre-start-hadoop.sh /home/jamesmo/pre-start-hadoop.sh
RUN chmod a+x /home/jamesmo/pre-start-hadoop.sh
ENTRYPOINT /home/jamesmo/pre-start-hadoop.sh && /usr/bin/supervisord

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030
