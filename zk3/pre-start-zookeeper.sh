# log dir
mkdir -p /home/chianyu/shared_with_docker_container/zookeeper-log-dir
chown -R zookeeper:zookeeper /home/chianyu/shared_with_docker_container/zookeeper-log-dir
. /etc/zookeeper/conf/zookeeper-env.sh

# init zookeeper data dir
echo "3" > /home/chianyu/shared_with_docker_container/zookeeper/myid
if [ ! -d /home/chianyu/shared_with_docker_container/zookeeper/version-2 ]; then
  chown -R zookeeper:zookeeper /home/chianyu/shared_with_docker_container/zookeeper
  service zookeeper-server init --myid=3
fi
