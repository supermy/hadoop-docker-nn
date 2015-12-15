#!/usr/bin/env bash
# gen hbase-site.xml
sed "s/HDFSNAMENODERPC_SERVICE_HOST/$HDFSNAMENODERPC_SERVICE_HOST/; s/HDFSNAMENODERPC_SERVICE_PORT/$HDFSNAMENODERPC_SERVICE_PORT/; s/HBASEMASTERIPC_SERVICE_PORT/$HBASEMASTERIPC_SERVICE_PORT_SERVICE_PORT/; s/ZOOKEEPERCLIENT_SERVICE_HOST/$ZOOKEEPERCLIENT_SERVICE_HOST/; s/ZOOKEEPERCLIENT_SERVICE_PORT/$ZOOKEEPERCLIENT_SERVICE_PORT/" /etc/hbase/conf/hbase-site.xml.template > /etc/hbase/conf/hbase-site.xml
cat /etc/hbase/conf/hbase-site.xml

# gen core-site.xml
sed "s/HDFSNAMENODERPC_SERVICE_HOST/$HDFSNAMENODERPC_SERVICE_HOST/;s/HDFSNAMENODERPC_SERVICE_PORT/$HDFSNAMENODERPC_SERVICE_PORT/" /etc/hadoop/conf/core-site.xml.template > /etc/hadoop/conf/core-site.xml
cat /etc/hadoop/conf/core-site.xml

# append host item
echo "$HBASEMASTERIPC_SERVICE_HOST hbase-master" >> /etc/hosts
cat /etc/hosts

# log dir
mkdir -p /home/jamesmo/shared_with_docker_container/hbase-log-dir
chown -R hbase:hbase /home/jamesmo/shared_with_docker_container/hbase-log-dir
. /etc/hbase/conf/hbase-env.sh

sleep 5

# data dir
sudo -u hdfs hadoop fs -mkdir -p hdfs://mynn:8020/hbase
sudo -u hdfs hadoop fs -chown hbase hdfs://mynn:8020/hbase
sudo -u hdfs hadoop fs -chmod 777 hdfs://mynn:8020/hbase

#初始化hive-hbase
#上传hive-hbase所需的jar包
sudo -u hdfs hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/hadoop/
sudo -u hdfs hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/hadoop-mapreduce/
sudo -u hdfs hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/zookeeper/
sudo -u hdfs hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/hbase/
sudo -u hdfs hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/hive/

sudo -u hdfs hdfs dfs -put  /usr/lib/hadoop/*   hdfs://mynn:8020/usr/lib/hadoop/
sudo -u hdfs hdfs dfs -put  /usr/lib/hadoop-mapreduce/*   hdfs://mynn:8020/usr/lib/hadoop-mapreduce/
sudo -u hdfs hdfs dfs -put  /usr/lib/zookeeper/*   hdfs://mynn:8020/usr/lib/zookeeper/
sudo -u hdfs hdfs dfs -put  /usr/lib/hbase/*   hdfs://mynn:8020/usr/lib/hbase/
sudo -u hdfs hdfs dfs -put  /usr/lib/hive/*  hdfs://mynn:8020/usr/lib/hive/


#构造hadoop用户目录，只有hadoop才有操作权限
mkdir -p /home/jamesmo/hive-hbase/
chown hdfs:hadoop /home/jamesmo/hive-hbase/
chmod 777 /home/jamesmo/hive-hbase/
cd /home/jamesmo/hive-hbase/

sudo -u hdfs hive --auxpath /usr/lib/hive/lib/hive-hbase-handler.jar,/usr/lib/hive/lib/hbase-server.jar,/usr/lib/hive/lib/zookeeper.jar -hiveconf hbase.zookeeper.quorum=zk_1
