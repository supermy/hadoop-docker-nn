#!/usr/bin/env bash
#hdfs 的基础包
rsync -vz  *  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-cdh5/

rsync -avz  hdfs/nn/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-nn/
rsync -avz  hdfs/dn/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-dn/
rsync -avz  hdfs/yarn/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-yarn/

#hbase的基础包
rsync -vz  hbase/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-hbase/

rsync -avz  hbase/hmaster/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-hb/
rsync -avz  hbase/hregionserver/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-rs/
rsync -avz  hbase/init-hive-hbase/*  /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-initdb/



cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-cdh5/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-nn/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-dn/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-rs/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-yarn/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

#hbase的基础包
cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-hbase/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-hb/
mkdir snappy
cp  *  snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-rs/
cp  *  snappy
mkdir snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称

cd /Users/moyong/project/env-myopensource/3-tools/docker/cloud/cloud-initdb/
cp  *  snappy
mkdir snappy
cp Dockerfile-snappy-spark snappy/Dockerfile
sh /Users/moyong/project/env-myopensource/3-tools/docker/mygit.sh  更新项目名称
