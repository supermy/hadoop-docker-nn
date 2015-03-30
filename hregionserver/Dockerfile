# Creates distributed cdh5
#
# docker build -t jamesmo/hregionserver:cdh5 .

FROM jamesmo/cdh5:latest
MAINTAINER james mo <springclick@gmail.com>

# config hbase
ADD hbase-env.sh /etc/hbase/conf/hbase-env.sh
ADD hbase-site.xml.template /etc/hbase/conf/hbase-site.xml.template

ADD regionservers /etc/hbase/conf/regionservers

# config hadoop client
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hbase
ADD pre-start-hbase.sh /home/jamesmo/pre-start-hbase.sh
RUN chmod a+x /home/jamesmo/pre-start-hbase.sh
ENTRYPOINT /home/jamesmo/pre-start-hbase.sh && /usr/bin/supervisord

EXPOSE 60020 60030
