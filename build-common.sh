#!/usr/bin/env bash
# build all docker images except jamesmo/cdh5:latest
# base

#第一次构造的时候放开，从网络同步资源，需要较好的带宽
#docker build -t jamesmo/cdh5 .

docker build -t jamesmo/nn:cdh5 hdfs/nn/
docker build -t jamesmo/dn:cdh5 hdfs/dn/
#docker build -t jamesmo/yarn:cdh5 hdfs/yarn/

#hbase+hive
#第一次构造的时候放开，从网络同步资源，需要较好的带宽
#docker build -t jamesmo/hbase:cdh5 hbase/
docker build -t jamesmo/hb:cdh5 hbase/hmaster/
docker build -t jamesmo/rs:cdh5 hbase/hregionserver/
docker build -t jamesmo/initdb:cdh5 hbase/init-hive-hbase/

#减少空间占用,删除压缩模式的镜像包
docker images|grep -v cdh5-|grep -v hbase|grep -v yarn|grep snappy-spark|awk '{print $3}'|xargs docker rmi

docker ps -a|awk '{print $1}'|xargs docker rm
docker images|grep none|awk '{print $3}'|xargs docker rmi

docker images|grep jamesmo


#rsync -avz -e ssh common/mykafka/*  /Users/moyong/project/env-myopensource/3-tools/docker/kafka/

