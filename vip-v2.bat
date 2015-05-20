sqlplus crcsh/crcsh@crcsh @c:\vip.sql
set pagesize=0
set mydate=%date:~0,4%%date:~5,2%%date:~8,2%
rename c:\vip.csv  "%mydate%剩余积分".csv
copy c:\*剩余积分.csv M:\crcshare\IT\每日销售\vip剩余积分\
del c:\*剩余积分.csv
