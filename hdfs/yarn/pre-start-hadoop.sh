# gen core-site.xml
#sed s/HOSTNAME/$HOSTNAME_NN/ /etc/hadoop/conf/core-site.xml.template > /etc/hadoop/conf/core-site.xml
sed "s/HDFSNAMENODERPC_SERVICE_HOST/$HDFSNAMENODERPC_SERVICE_HOST/;s/HDFSNAMENODERPC_SERVICE_PORT/$HDFSNAMENODERPC_SERVICE_PORT/" /etc/hadoop/conf/core-site.xml.template > /etc/hadoop/conf/core-site.xml

cat /etc/hadoop/conf/core-site.xml

sudo -u hdfs hadoop fs -mkdir /tmp
sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

# log dir
mkdir -p /home/jamesmo/shared_with_docker_container/hadoop-log-dir
chown -R hdfs:hdfs /home/jamesmo/shared_with_docker_container/hadoop-log-dir

#YARN-START
#Create the yarn.nodemanager.local-dirs local directories:
sudo mkdir -p /data/1/yarn/local /data/2/yarn/local /data/3/yarn/local /data/4/yarn/local
#Create the yarn.nodemanager.log-dirs local directories:
sudo mkdir -p /data/1/yarn/logs /data/2/yarn/logs /data/3/yarn/logs /data/4/yarn/logs
#Configure the owner of the yarn.nodemanager.local-dirs directory to be the yarn user:
sudo chown -R yarn:yarn /data/1/yarn/local /data/2/yarn/local /data/3/yarn/local /data/4/yarn/local
#Configure the owner of the yarn.nodemanager.log-dirs directory to be the yarn user:
sudo chown -R yarn:yarn /data/1/yarn/logs /data/2/yarn/logs /data/3/yarn/logs /data/4/yarn/logs


#HISTORY-SERVER-BEGIN
sudo -u hdfs hadoop fs -mkdir -p /user/history
sudo -u hdfs hadoop fs -chmod -R 1777 /user/history
sudo -u hdfs hadoop fs -chown mapred:hadoop /user/history
#HISTORY-SERVER-END

#Create Log Directories
sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-mapreduce
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-mapreduce

sudo -u hdfs hadoop fs -ls -R /

#sudo service hadoop-yarn-resourcemanager start
#sudo service hadoop-yarn-nodemanager start
#sudo service hadoop-mapreduce-historyserver start

#$ sudo -u hdfs hadoop fs -mkdir  /user/<user>
#$ sudo -u hdfs hadoop fs -chown <user> /user/<user>

#sudo -u hdfs hadoop fs -mkdir /user/$USER
#sudo -u hdfs hadoop fs -chown $USER /user/$USER

#YARN-END


## create and format namenode if not exist
#CLUSTER_ID=CID-c162a031-783e-4db8-823f-ab1ef43dbae8        # an unique cluster id for hadoop cluster
#if [ ! -d /home/jamesmo/shared_with_docker_container/cdh5/nn/current ]; then
#  mkdir -p /home/jamesmo/shared_with_docker_container/cdh5/nn
#  chown -R hdfs:hdfs /home/jamesmo/shared_with_docker_container/cdh5/nn
#  chmod 700 /home/jamesmo/shared_with_docker_container/cdh5/nn
#  sudo -u hdfs hdfs namenode -format -clusterId $CLUSTER_ID # always format with the same cluster id
#fi
