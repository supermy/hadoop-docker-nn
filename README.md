2015-03-05
    hbase的集群配置进行中；
    web测试:http://192.168.2.100:60010/master.jsp
    /etc/init.d/hbase-master start
    hbase shell
    >status
    >version

    重新build image;
    web访问ok
    http://192.168.59.103:50070/
    http://192.168.59.103:60010/
    http://192.168.59.103:60030/

2015-02-16
    hadoop启动时候core-site.xml进行了处理；
    完成了hadoop的集群处理；
    hbase的集群配置中；

测试说明：
    2.1使用fig up -d 启动集群
    2.2安装容器工具，进入namenode容器
         docker run -v /usr/local/bin:/target jpetazzo/nsenter:latest
         docker ps -a|grep namenode
         docker-enter b58bc02af904
    2.3运行指令
        su hdfs
        hdfs dfs -mkdir -p hdfs://172.17.1.36:8020/user/hdfs/input
        hdfs dfs -put core-site.xml hdfs://172.17.1.36:8020/user/hdfs/input
        hdfs dfs -ls hdfs://172.17.1.36:8020/user/hdfs/input
        hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar grep input output 'dfs[a-z.]+'

        nc -v -z -w2 172.17.1.36 8020

        nc -v -z -w2  hdfsnamenoderpc.kubernetes.local 8020

#Apache Hadoop 2.5.1 Docker image

_Note: this is the master branch - for a particular Hadoop version always check the related branch_

A few weeks ago we released an Apache Hadoop 2.3 Docker image - this quickly become the most [popular](https://registry.hub.docker.com/search?q=hadoop&s=downloads) Hadoop image in the Docker [registry](https://registry.hub.docker.com/).


Following the success of our Hadoop 2.3 Docker [image](https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/), the feedback and feature requests we received aligned with the Hadoop release cycle, so we have released an Apache Hadoop 2.5.1 Docker image - same as the previous version, it's available as a trusted and automated build on the official Docker [registry](https://registry.hub.docker.com/).


_FYI: All the former Hadoop releases (2.3, 2.4.0, 2.4.1, 2.5.0, 2.5.1) are available in the GitHub branches or our [Docker Registry](https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/) - check the tags._

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t sequenceiq/hadoop-docker:2.5.1 .
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull sequenceiq/hadoop-docker:2.5.1
```

# Start a container

In order to use the Docker image you have just build or pulled use:

```
docker run -i -t sequenceiq/hadoop-docker:2.5.1 /etc/bootstrap.sh -bash
```

## Testing

You can run one of the stock examples:

```
cd $HADOOP_PREFIX
# run the mapreduce
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.5.1.jar grep input output 'dfs[a-z.]+'

# check the output
bin/hdfs dfs -cat output/*
```

## Hadoop native libraries, build, Bintray, etc

The Hadoop build process is no easy task - requires lots of libraries and their right version, protobuf, etc and takes some time - we have simplified all these, made the build and released a 64b version of Hadoop nativelibs on this [Bintray repo](https://bintray.com/sequenceiq/sequenceiq-bin/hadoop-native-64bit/2.5.1/view/files). Enjoy.

## Automate everything

As we have mentioned previousely, a Docker file was created and released in the official [Docker repository](https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/)
