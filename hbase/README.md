微云（可快速扩充）
====================

HBase+Hive-介绍
---------------------

HBase是一个分布式的、面向列的开源数据库，该技术来源于 Fay Chang 所撰写的Google论文“Bigtable：一个结构化数据的分布式存储系统”。就像
Bigtable利用了Google文件系统（File System）所提供的分布式数据存储一样，HBase在Hadoop之上提供了类似于Bigtable的能力。HBase是Apache
的Hadoop项目的子项目。HBase不同于一般的关系数据库，它是一个适合于非结构化数据存储的数据库。另一个不同的是HBase基于列的而不是基于行的模式

Pig和Hive还为HBase提供了高层语言支持，使得在HBase上进行数据统计处理变的非常简单。 Sqoop则为HBase提供了方便的RDBMS数据导入功能，使得传
统数据库数据向HBase中迁移变的非常方便。

* 1. Native Java API，最常规和高效的访问方式，适合Hadoop MapReduce Job并行批处理HBase表数据
* 2. HBase Shell，HBase的命令行工具，最简单的接口，适合HBase管理使用
* 3. Thrift Gateway，利用Thrift序列化技术，支持C++，PHP，Python等多种语言，适合其他异构系统在线访问HBase表数据
* 4. REST Gateway，支持REST 风格的Http API访问HBase, 解除了语言限制
* 5. Pig，可以使用Pig Latin流式编程语言来操作HBase中的数据，和Hive类似，本质最终也是编译成MapReduce Job来处理HBase表数据，适合做数据统计
* 6. Hive，当前Hive的Release版本尚没有加入对HBase的支持，但在下一个版本Hive 0.7.0中将会支持HBase，可以使用类似SQL语言来访问HBase

![alt 架构图](resource/hbase-example2.jpg "架构图")

![alt 架构图](resource/hbase-example.jpg "架构图")


运行示例
---------------------
### 运行
> 进入到当前目录
> ## fig up -d && fig logs {namenode 节点启动较慢,需要二次启动}
### 观察日志
>
> [访问hbase信息页面 ](http://192.168.59.103:60010/) 通过 http://192.168.59.103:60010/。
>
> [访问RegionServer的信息页面 ](http://192.168.59.103:60010/) 通过 http://192.168.59.103:60030/。
>


测试snappy安装是否成功：

1 . 使用 CompressionTest 来查看snappy是否 enabled 并且能成功 loaded:

* docker exec -u hdfs hbase_hb_1 bash -c "hdfs dfs -mkdir -p myhbase && \
    hbase org.apache.hadoop.hbase.util.CompressionTest snappytest snappy"

2 . 创建一章以snappy方式压缩的表来检查能否成功:

####初始化日志数据表

* docker exec -u hdfs hbase_hb_1 bash -c "hbase shell < /data/hbase/hbase-init.rb"

* docker exec -u hdfs hbase_rs_1 bash -c "hive -f /data/hbase/hive-init.sql"


#在hbase插入一条数据,hive查询数据同步增加
#>hbase shell
#>put 'hive_hbase_log',1, 'log:full', '100'
#>scan ‘hive_hbase_log'

> ## hbase+hive示例


## 容器与主机互相拷贝文件

从容器内拷贝文件到主机上
docker cp <containerId>:/file/path/within/container /host/path/target 
从主机上拷贝文件到容器内
1.用-v挂载主机数据卷到容器内
2.直接在主机上拷贝到容器物理存储系统
$ sudo cp path-file-host /var/lib/docker/aufs/mnt/FULL_CONTAINER_ID/PATH-NEW-FILE 
或者
$ sudo cp path-file-host /var/lib/docker/devicemapper/mnt/123abc<<id>>/rootfs/root
3.用输入输出符
docker exec -it <container_id> bash -c 'cat > /path/to/container/file' < /path/to/host/file/ 
