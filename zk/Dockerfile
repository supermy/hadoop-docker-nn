# Creates distributed cdh5
#
# docker build -t bioshrek/zookeeper:cdh5 .

FROM bioshrek/hadoop-base:cdh5
MAINTAINER Huan Wang <shrekwang1@gmail.com>

# config zookeeper
ADD zoo.cfg /etc/zookeeper/conf/zoo.cfg
ADD zookeeper-env.sh /etc/zookeeper/conf/zookeeper-env.sh

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start zookeeper
ADD pre-start-zookeeper.sh /home/chianyu/pre-start-zookeeper.sh
RUN chmod a+x /home/chianyu/pre-start-zookeeper.sh
ENTRYPOINT /home/chianyu/pre-start-zookeeper.sh && /usr/bin/supervisord

EXPOSE 2181 2888 3888
