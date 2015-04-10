# Creates distributed cdh5
#
# docker build -t jamesmo/hregionserver:cdh5 .

FROM jamesmo/hbase:cdh5
MAINTAINER james mo <springclick@gmail.com>

# config hbase
ADD hbase-env.sh /etc/hbase/conf/hbase-env.sh
ADD hbase-site.xml.template /etc/hbase/conf/hbase-site.xml.template

ADD regionservers /etc/hbase/conf/regionservers

#hive-hbase-init
ADD pre-start-hive.sh /home/jamesmo/pre-start-hive.sh
ADD start-hive.sh /home/jamesmo/start-hive.sh
ADD hbase-init.rb /home/jamesmo/hbase-init.rb

ADD hive-init.sql /home/jamesmo/hive-init.sql
#ADD hbase-init.sql /home/jamesmo/hbase-init.sql

RUN chmod a+x /home/jamesmo/start-hive.sh
RUN chmod a+xr /home/jamesmo/hbase-init.rb
RUN chmod a+x /home/jamesmo/pre-start-hive.sh

#COPY gndata /home/jamesmo/

#hive-end

# config hadoop client
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hbase
ADD pre-start-hbase.sh /home/jamesmo/pre-start-hbase.sh
RUN chmod a+x /home/jamesmo/pre-start-hbase.sh

ENTRYPOINT /home/jamesmo/pre-start-hbase.sh && /home/jamesmo/pre-start-hive.sh

EXPOSE 60020 60030
