#hbase shell < hbase-init.rb
put "hive_hbase_log",2, "log:full", "100"
scan "hive_hbase_log"
create 't1', { NAME => 'cf1', COMPRESSION => 'snappy' }
describe 't1'
