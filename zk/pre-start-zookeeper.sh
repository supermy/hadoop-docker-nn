# log dir
mkdir -p /home/jamesmo/shared_with_docker_container/zookeeper-log-dir
chown -R zookeeper:zookeeper /home/jamesmo/shared_with_docker_container/zookeeper-log-dir
. /etc/zookeeper/conf/zookeeper-env.sh

# init zookeeper data dir
if [ ! -d /home/jamesmo/shared_with_docker_container/zookeeper/version-2 ]; then
  chown -R zookeeper:zookeeper /home/jamesmo/shared_with_docker_container/zookeeper
  service zookeeper-server init --myid=1
fi
