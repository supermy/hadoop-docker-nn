微云（可快速扩充）
====================

一键构造大数据平台-介绍
---------------------
[Hadoop介绍](hdfs/README.md) 及应用场景.

[Hbase+Hive介绍](hbase/README.md) 及应用场景.

[普通版镜像包构造](build-common.sh)

[压缩版镜像包构造《比较大》](build-snappy-spark.sh)

### 常用场景1 hbase+hive(hbase进行删改的数据维护,hive进行复查查询和导入数据)

> [通过hive创建hbase表](hbase/hregionserver/hive-init.sql),在hive中增加数据，hbase同步增加数据，查看hive的数据。
> [通过hive创建hbase表](hbase/hregionserver/hbase-init.rb),在hbase中增加数据，查看hbase数据。


运行示例
---------------------
### 运行
> 进入到当前目录
> ## fig up -d && fig logs [namenode 节点启动较慢,需要二次启动]
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

https://github.com/supermy/hadoop-docker-nn
http://t.cn/RA6by8L