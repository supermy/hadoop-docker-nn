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


# data dir
sudo -u hdfs hadoop fs -mkdir -p hdfs://$HDFSNAMENODERPC_SERVICE_HOST:$HDFSNAMENODERPC_SERVICE_PORT/hbase
sudo -u hdfs hadoop fs -chown hbase hdfs://$HDFSNAMENODERPC_SERVICE_HOST:$HDFSNAMENODERPC_SERVICE_PORT/hbase
