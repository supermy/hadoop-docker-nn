# log dir
mkdir -p /home/chianyu/shared_with_docker_container/zookeeper-log-dir
chown -R zookeeper:zookeeper /home/chianyu/shared_with_docker_container/zookeeper-log-dir
. /etc/zookeeper/conf/zookeeper-env.sh

# init zookeeper data dir
if [ ! -d /home/chianyu/shared_with_docker_container/zookeeper/version-2 ]; then
  chown -R zookeeper:zookeeper /home/chianyu/shared_with_docker_container/zookeeper
  service zookeeper-server init --myid=1
fi
