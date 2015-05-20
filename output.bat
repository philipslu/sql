sqlplus crcsh/crcsh@crcsh @c:\output.sql
set pagesize=1
set mydate=%date:~0,4%%date:~5,2%%date:~8,2%
rename c:\output.csv  "Sheet1".csv

