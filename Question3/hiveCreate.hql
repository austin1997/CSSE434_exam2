create  database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};
Create TABLE IF NOT EXISTS ${hiveconf:tempTableName}
(
name string,
cno string,
cname string,
grade string
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

Create TABLE IF NOT EXISTS ${hiveconf:tableName}
(
name string,
cno string,
cname string,
grade string
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc;