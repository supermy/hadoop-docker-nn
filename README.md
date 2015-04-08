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
> ## fig up -d && fig ps
### 观察日志
>
* 查看hive+hbase数据表建立以及数据导入的情况：fig logs initdb
*
* docker run -v /usr/local/bin:/target jpetazzo/nsenter:latest
*
* 初始化环境：docker-enter cid 进入 hregionserver容器：完成hive-hbase环境准备，和日志表建设，cd /home/jamesmo/ && start pre-start-hive.sh
*
* 查看数据-hive数据(hregionserver-node)
*
* sh /home/jamesmo/start-hive.sh  && select * from hive_hbase_log
*
* 查看数据-hbse数据(hregionserver-node)
*
* hbase shell
*  <'scan "hive_hbase_log"'
*
> ## hbase+hive示例

压缩是否支持测试
---------------------
### 运行
> 1.进入到当前目录
> 构造镜像包：sh build-snappy-spark.sh
> 启动镜像包：sh run-snappy-spark.sh
> docker run -v /usr/local/bin:/target jpetazzo/nsenter:latest
>  初始化环境：docker-enter cid 进入 hregionserver容器
> 测试snappy:sudo -u hdfs hbase org.apache.hadoop.hbase.util.CompressionTest hdfs://mynn:8020/hbase1 snappy
>
> 2 . 创建一章以snappy方式压缩的表来检查能否成功:
>
> $ hbase shell
>  create 't1', { NAME => 'cf1', COMPRESSION => 'snappy' }
>  describe 't1'
>
> 在"describe" 命令输出中, 需要确认 "COMPRESSION => 'snappy'"
> ## hbase+hive snappy支持
>