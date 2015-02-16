# gen core-site.xml
sed s/HOSTNAME/$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')/ /etc/hadoop/conf/core-site.xml.template > /etc/hadoop/conf/core-site.xml
cat /etc/hadoop/conf/core-site.xml

# log dir
mkdir -p /home/chianyu/shared_with_docker_container/hadoop-log-dir
chown -R hdfs:hdfs /home/chianyu/shared_with_docker_container/hadoop-log-dir

# create and format namenode if not exist
CLUSTER_ID=CID-c162a031-783e-4db8-823f-ab1ef43dbae8        # an unique cluster id for hadoop cluster
if [ ! -d /home/chianyu/shared_with_docker_container/cdh5/nn/current ]; then
  mkdir -p /home/chianyu/shared_with_docker_container/cdh5/nn
  chown -R hdfs:hdfs /home/chianyu/shared_with_docker_container/cdh5/nn
  chmod 700 /home/chianyu/shared_with_docker_container/cdh5/nn
  sudo -u hdfs hdfs namenode -format -clusterId $CLUSTER_ID # always format with the same cluster id
fi
