sqlplus crcsh/crcsh@crcsh @c:\vip.sql
set pagesize=0
set mydate=%date:~0,4%%date:~5,2%%date:~8,2%
rename c:\vip.csv  "%mydate%ʣ�����".csv
copy c:\*ʣ�����.csv M:\crcshare\IT\ÿ������\vipʣ�����\
del c:\*ʣ�����.csv
