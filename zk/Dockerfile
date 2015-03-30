# Creates distributed cdh5
#
# docker build -t jamesmo/zookeeper:cdh5 .

FROM jamesmo/cdh5:latest
MAINTAINER Huan Wang <shrekwang1@gmail.com>

# config zookeeper
ADD zoo.cfg /etc/zookeeper/conf/zoo.cfg
ADD zookeeper-env.sh /etc/zookeeper/conf/zookeeper-env.sh

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start zookeeper
ADD pre-start-zookeeper.sh /home/jamesmo/pre-start-zookeeper.sh
RUN chmod a+x /home/jamesmo/pre-start-zookeeper.sh
ENTRYPOINT /home/jamesmo/pre-start-zookeeper.sh && /usr/bin/supervisord

EXPOSE 2181 2888 3888
