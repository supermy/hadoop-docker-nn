# Creates distributed cdh5
#
# docker build -t bioshrek/hbase-master:cdh5 .

FROM bioshrek/hadoop-base:cdh5
MAINTAINER james mo <springclick@gmail.com>

# config hbase
#RUN sed -i '1d' /etc/hostname
#RUN sed -i 1i 'abc' /etc/hostname
#RUN sudo hostname hbasemasteripc
#RUN echo 'hbasemasteripc'>> /etc/hostname

#ADD hostname /etc/hostname  # override hostname
RUN cat /etc/hostname
ADD hbase-env.sh /etc/hbase/conf/hbase-env.sh
ADD hbase-site.xml.template /etc/hbase/conf/hbase-site.xml.template

# config hadoop client
ADD core-site.xml.template /etc/hadoop/conf/core-site.xml.template
ADD hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh

# supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start hbase
ADD pre-start-hbase.sh /home/chianyu/pre-start-hbase.sh
RUN chmod a+x /home/chianyu/pre-start-hbase.sh
ENTRYPOINT /home/chianyu/pre-start-hbase.sh && /usr/bin/supervisord

EXPOSE 60000 60010
