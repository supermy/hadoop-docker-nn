CREATE TABLE IF NOT EXISTS info_text(
    f1 string,
    f2 string
  )
   ROW FORMAT DELIMITED FIELDS TERMINATED BY '\|' LINES TERMINATED BY '\n'
   STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS info_rcfile(
    f1 string,
    f2 string
  )
     ROW FORMAT DELIMITED FIELDS TERMINATED BY '\|' LINES TERMINATED BY '\n'
     STORED AS RCFILE;

load data local inpath '/data/hbase/gndata/1.txt' OVERWRITE into table info_text;
insert into table info_rcfile select * from info_text;

select * from info_rcfile limit 20;
select * from info_text limit 20;
--
-- select INPUT__FILE__NAME,office_no, BLOCK__OFFSET__INSIDE__FILE from locallzo limit 20;
-- select INPUT__FILE__NAME,unum, BLOCK__OFFSET__INSIDE__FILE from raw limit 10;
