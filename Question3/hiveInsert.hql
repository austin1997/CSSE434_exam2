use ${hiveconf:databaseName};

LOAD DATA INPATH '${hiveconf:pigOutput}' INTO Table ${hiveconf:tempTableName} Partition(username = 'zhaiz');

Set hive.exec.dynamic.partition.mode=nonstrict;
insert into table ${hiveconf:tableName} partition(username) select name, cno, cname, grade, username from ${hiveconf:tempTableName};