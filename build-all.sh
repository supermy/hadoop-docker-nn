# build all docker images except bioshrek/hadoop-base:cdh5
sudo docker build -t bioshrek/hadoop-hdfs-namenode:cdh5 nn/
sudo docker build -t bioshrek/hadoop-hdfs-datanode:cdh5 dn/
sudo docker build -t bioshrek/zookeeper:cdh5 zk/
sudo docker build -t bioshrek/hbase-master:cdh5 hmaster/
sudo docker build -t bioshrek/hbase-regionserver:cdh5 hregionserver/
