2015-03-30
    https://issues.apache.org/jira/browse/HADOOP-10558
    节点在zookeeper注册的是主机名，调试的时候要把host文件加上节点信息例如 192.168.159.2 master master
    设定docker容器的hostname
    **约定名称与变量替换混用**
    **最终，约定名称使用;link不支持循环调用**

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
