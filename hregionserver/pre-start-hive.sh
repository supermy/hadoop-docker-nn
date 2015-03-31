#初始化hive-hbase
#上传hive-hbase所需的jar包
sudo -u hdfs  hdfs dfs -mkdir -p hdfs://mynn:8020/usr/lib/hadoop/
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

#初始化日志数据表
sudo -u hdfs hive -f /home/jamesmo/hive-init.sql

sudo -u hdfs hbase shell </home/jamesmo/hbase-init.rb

#在hbase插入一条数据,hive查询数据同步增加
#>hbase shell
#>put 'hive_hbase_log',1, 'log:full', '100'
#>scan ‘hive_hbase_log'
