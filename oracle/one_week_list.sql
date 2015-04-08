select '前一天:' || (t) || '--全馆销售为' ||round(g0 / 10000, 1) || '万元。'
||chr(10)||'前两天:' || (t1) || '--全馆销售为' ||round(g / 10000, 1) || '万元。'
||chr(10)||'前三天:' || (t2) || '--全馆销售为' ||round(g1 / 10000, 1) || '万元。'
||chr(10)||'前四天:' || (t3) || '--全馆销售为' ||round(g2 / 10000, 1) || '万元。'
||chr(10)||'前五天:' || (t4) || '--全馆销售为' ||round(g3 / 10000, 1) || '万元。'
||chr(10)||'前六天:' || (t5) || '--全馆销售为' ||round(g4 / 10000, 1) || '万元。'
||chr(10)||'前七天:' || (t6) || '--全馆销售为' ||round(g5 / 10000, 1) || '万元。'
||chr(10)||'前八天:' || (t7) || '--全馆销售为' ||round(g6 / 10000, 1) || '万元。'
 from (select telephone z,
               --日
               --对应前一天
               (select to_char((sysdate - 1), 'yyyy-mm-dd') from dual) t,
               (select to_char((sysdate - 2), 'yyyy-mm-dd') from dual) t1,
               (select to_char((sysdate - 3), 'yyyy-mm-dd') from dual) t2,
               (select to_char((sysdate - 4), 'yyyy-mm-dd') from dual) t3,
               (select to_char((sysdate - 5), 'yyyy-mm-dd') from dual) t4,
               (select to_char((sysdate - 6), 'yyyy-mm-dd') from dual) t5,
               (select to_char((sysdate - 7), 'yyyy-mm-dd') from dual) t6,
               (select to_char((sysdate - 8), 'yyyy-mm-dd') from dual) t7,
               --获取前一天日期(select to_char((sysdate-1),'yyyymmdd') from dual ),'yyyymmdd')
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g0, 
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 2), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g,          
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 3), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g1,
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 4), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g2,
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 5), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g3,
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 6), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g4, 
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 7), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g5,
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 8), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g6
          from xf_smslist) where ROWNUM <= 1;
