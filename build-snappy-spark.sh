#!/usr/bin/env bash
# build all docker images except jamesmo/cdh5:latest
# base

# hdfs
##第一次构造的时候放开，从网络同步资源，需要较好的带宽
#docker build -t jamesmo/cdh5-snappy-spark -f Dockerfile-snappy-spark .
sed s/cdh5\:latest/cdh5-snappy-spark\:latest/ hdfs/nn/Dockerfile > hdfs/nn/Dockerfile-snappy-spark
sed s/cdh5\:latest/cdh5-snappy-spark\:latest/ hdfs/dn/Dockerfile > hdfs/dn/Dockerfile-snappy-spark
sed s/cdh5\:latest/cdh5-snappy-spark\:latest/ hdfs/yarn/Dockerfile > hdfs/yarn/Dockerfile-snappy-spark

docker build -t jamesmo/snappy-spark-nn:cdh5 -f  hdfs/nn/Dockerfile-snappy-spark  hdfs/nn/
docker build -t jamesmo/snappy-spark-dn:cdh5 -f  hdfs/dn/Dockerfile-snappy-spark  hdfs/dn/
docker build -t jamesmo/snappy-spark-yarn:cdh5 -f  hdfs/yarn/Dockerfile-snappy-spark  hdfs/yarn/


# hbase+hive
#第一次构造的时候放开，从网络同步资源，需要较好的带宽
#加入压缩
#docker build -t jamesmo/hbase-snappy-spark:cdh5 -f  hbase/Dockerfile-snappy-spark hbase/
sed s/hbase\:cdh5/hbase-snappy-spark\:cdh5/ hbase/hmaster/Dockerfile > hbase/hmaster/Dockerfile-snappy-spark
sed s/hbase\:cdh5/hbase-snappy-spark\:cdh5/ hbase/hregionserver/Dockerfile > hbase/hregionserver/Dockerfile-snappy-spark
sed s/hbase\:cdh5/hbase-snappy-spark\:cdh5/ hbase/init-hive-hbase/Dockerfile > hbase/init-hive-hbase/Dockerfile-snappy-spark

docker build -t jamesmo/snappy-spark-hb:cdh5 -f  hbase/hmaster/Dockerfile-snappy-spark hbase/hmaster/
docker build -t jamesmo/snappy-spark-rs:cdh5 -f  hbase/hregionserver/Dockerfile-snappy-spark hbase/hregionserver/
docker build -t jamesmo/snappy-spark-initdb:cdh5 -f  hbase/init-hive-hbase/Dockerfile-snappy-spark hbase/init-hive-hbase/

#减少空间占用,删除压缩模式的镜像包
docker images|grep cdh5|grep -v snappy-spark|grep -v hbase|grep -v yarn|grep -v latest|awk '{print $3}'|xargs docker rmi

docker ps -a|awk '{print $1}'|xargs docker rm
docker images|grep none|awk '{print $3}'|xargs docker rmi

docker images|grep jamesmo
