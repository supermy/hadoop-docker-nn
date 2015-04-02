#hbase shell < hbase-init.rb
put "hive_hbase_log",2, "log:full", "100"
scan "hive_hbase_log"