SET PAGESIZE 0;
SET LINESIZE 5000;
SET TRIMSPOOL ON;
SET TERMOUT OFF;
SET TIMING ON; 
spool c:\\vip.csv
select a.xf_vipcode||','||a.xf_surname||','||b.bb from xf_vip a,(select xf_vipcode,sum(xf_bonus) bb from xf_bonusledger where to_char(xf_txdate,'yyyymmdd')>='20140101'and substr(xf_vipcode,1,1) in ('3','4','5') group by xf_vipcode having sum(xf_bonus)<>0) b where a.xf_vipcode=b.xf_vipcode and a.xf_active='1' order by a.xf_vipcode;
spool off;
exit;
