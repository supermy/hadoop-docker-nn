mkdir -p /home/jamesmo/hive-hbase/
chown hdfs:hadoop /home/jamesmo/hive-hbase/
chmod 777 /home/jamesmo/hive-hbase/
cd /home/jamesmo/hive-hbase/
sudo -u hdfs hive --auxpath /usr/lib/hive/lib/hive-hbase-handler.jar,/usr/lib/hive/lib/hbase-server.jar,/usr/lib/hive/lib/zookeeper.jar -hiveconf hbase.zookeeper.quorum=zk_1
