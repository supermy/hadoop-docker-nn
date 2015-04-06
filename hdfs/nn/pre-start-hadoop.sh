# gen core-site.xml
sed s/HOSTNAME/$HOSTNAME_NN/ /etc/hadoop/conf/core-site.xml.template > /etc/hadoop/conf/core-site.xml
cat /etc/hadoop/conf/core-site.xml

# log dir
mkdir -p /home/jamesmo/shared_with_docker_container/hadoop-log-dir
chown -R hdfs:hdfs /home/jamesmo/shared_with_docker_container/hadoop-log-dir


sudo -u hdfs hadoop fs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

# create and format namenode if not exist
CLUSTER_ID=CID-c162a031-783e-4db8-823f-ab1ef43dbae8        # an unique cluster id for hadoop cluster
if [ ! -d /home/jamesmo/shared_with_docker_container/cdh5/nn/current ]; then
  mkdir -p /home/jamesmo/shared_with_docker_container/cdh5/nn
  chown -R hdfs:hdfs /home/jamesmo/shared_with_docker_container/cdh5/nn
  chmod 700 /home/jamesmo/shared_with_docker_container/cdh5/nn
  sudo -u hdfs hdfs namenode -format -clusterId $CLUSTER_ID # always format with the same cluster id
fi