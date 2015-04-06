# build all docker images except jamesmo/cdh5:latest
# base
#docker build -t jamesmo/cdh5 .
#docker build -t jamesmo/cdh5-snappy-spark -f Dockerfile-snappy-spark .
# hdfs
docker build -t jamesmo/nn:cdh5 hdfs/nn/
docker build -t jamesmo/dn:cdh5 hdfs/dn/
docker build -t jamesmo/yarn:cdh5 hdfs/yarn/
# hbase+hive
docker build -t jamesmo/hbase:cdh5 hbase/
docker build -t jamesmo/hbase-snappy-spark:cdh5 -f  hbase/Dockerfile-snappy-spark hbase/

docker build -t jamesmo/hmaster:cdh5 hbase/hmaster/
docker build -t jamesmo/hregionserver:cdh5 hbase/hregionserver/
docker build -t jamesmo/inithivehbase:cdh5 hbase/init-hive-hbase/

docker ps -a|awk '{print $1}'|xargs docker rm
docker images|grep none|awk '{print $3}'|xargs docker rmi

docker images|grep jamesmo
