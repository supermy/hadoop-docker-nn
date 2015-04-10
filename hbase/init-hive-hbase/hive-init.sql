ADD JAR /usr/lib/hive/lib/zookeeper.jar;
ADD JAR /usr/lib/hive/lib/hive-hbase-handler.jar;
ADD JAR /usr/lib/hbase/lib/guava-12.0.1.jar;
ADD JAR /usr/lib/hbase/hbase-client.jar;
ADD JAR /usr/lib/hbase/hbase-common.jar;
ADD JAR /usr/lib/hbase/hbase-hadoop-compat.jar;
ADD JAR /usr/lib/hbase/hbase-hadoop2-compat.jar;
ADD JAR /usr/lib/hbase/hbase-protocol.jar;
ADD JAR /usr/lib/hbase/hbase-server.jar;

SET hive.exec.compress.output=true;
SET mapred.output.compress=true;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type=BLOCK;

CREATE TABLE hive_hbase_log (key int, value string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,log:full");

CREATE TABLE pokes (foo INT, bar STRING);
LOAD DATA LOCAL INPATH '/usr/share/doc/hive/examples/files/kv3.txt' OVERWRITE INTO TABLE pokes;
INSERT OVERWRITE TABLE hive_hbase_log SELECT foo,bar FROM pokes WHERE foo=66;
SELECT * FROM hive_hbase_log;

CREATE TABLE info_text(
    f1 string,
    f2 string
  )
   ROW FORMAT DELIMITED FIELDS TERMINATED BY '\|' LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;

CREATE TABLE info_rcfile(
    f1 string,
    f2 string
  )
     ROW FORMAT DELIMITED FIELDS TERMINATED BY '\|' LINES TERMINATED BY '\n'
     STORED AS RCFILE;

load data local inpath '/home/jamesmo/1.txt' OVERWRITE into table info_text;
insert into table info_rcfile select * from info_text;

select * from info_rcfile limit 20;
select * from info_text limit 20;

select INPUT__FILE__NAME,unum, BLOCK__OFFSET__INSIDE__FILE from raw limit 10;
select INPUT__FILE__NAME,office_no, BLOCK__OFFSET__INSIDE__FILE from locallzo limit 20;
