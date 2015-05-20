SET PAGESIZE 1;
SET LINESIZE 5000;
SET TRIMSPOOL ON;
SET TERMOUT OFF;
SET TIMING OFF; 
spool c:\\output.csv
select 'P00004'||','||to_char((b.xf_txdate),'yyyy/mm/dd')||','||sum(trunc(b.xf_qtysold, 0))||','||sum(b.xf_amtsold)||','||'null' from xf_transsalesitem b,xf_store a WHERE XF_txdate between SYSDATE-2 and sysdate-1 and a.xf_storecode=b.xf_storecode group by b.xf_txdate;
spool off;
exit;
