CREATE TABLE hive_hbase_log (key int, value string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,log:full");

CREATE TABLE pokes (foo INT, bar STRING);
LOAD DATA LOCAL INPATH '/usr/share/doc/hive/examples/files/kv3.txt' OVERWRITE INTO TABLE pokes;
INSERT OVERWRITE TABLE hive_hbase_log SELECT foo,bar FROM pokes WHERE foo=66;
SELECT * FROM hive_hbase_log;