REGISTER 'hdfs:///tmp/Exams/zhaizUDF.jar';
DEFINE CONCATFUNC edu.rosehulman.zhaiz.Concat();
DEFINE CONVERTFUNC edu.rosehulman.zhaiz.Convert();

grades = LOAD '$gradeInput' using PigStorage(',') AS (fName:chararray, lName:chararray, courseNum:chararray, score:int);
fgrades = FILTER grades by score<=90;
courses = LOAD '$courseInput' using PigStorage(',') AS (courseNum:chararray, courseName:chararray);
joined = JOIN fgrades by courseNum, courses by courseNum;
temp = FOREACH joined GENERATE CONCATFUNC(fgrades::fName, fgrades::lName), courses::courseNum, courses::courseName, CONVERTFUNC(fgrades::score);
STORE temp into '$pigOutput/$username' using PigStorage(',');
