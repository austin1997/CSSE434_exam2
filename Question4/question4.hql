use ${hiveconf:databaseName};

select * from (select cno as cno, COUNT(cno) as num from ${hiveconf:tableName} where grade != 'D' GROUP BY cno) A where A.num 
>=2;