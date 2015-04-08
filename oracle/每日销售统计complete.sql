select '商场中央收银销售' || round(f / 10000, 1) || '万元，全馆销售' ||
       round(g / 10000, 1) || '万元。全馆当月累计销售' || round(b / 10000, 1) ||
       '万元，同比增长' || round((b - d) / d * 100, 1) || '%，环比增长' ||
       round((b - e) / e * 100, 1) || '%,全馆当年累计销售' || round(a / 10000, 1) ||
       '万元。'||chr(10)||'前一天' || (t1) || ';前一年同月' || (t2) || ';上一月' || (t3) || '。'
 from (select telephone z,
               --日
               --对应前一天
               (select to_char((sysdate - 1), 'yyyy-mm-dd') from dual) t1,
               --对应前一年同月同日
               (select to_char((sysdate - 366), 'yyyy-mm-dd') from dual) t2,
               --对应上一月同日
               (select to_char((sysdate - 32), 'yyyy-mm-dd') from dual) t3,
               --获取前一天日期(select to_char((sysdate-1),'yyyymmdd') from dual ),'yyyymmdd')
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_storecode = '888888'
                   and xf_Txdate =
                       to_Date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) f,
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate =
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) g,
               --月累计
               --每月月头至月尾
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 1), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) b,
               --前一年同月比较，范围为与当年的月日与前一年月日相同，年份不同
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 366), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 366), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) d,
               --上一个月比较，范围为上一个月的月头至月尾
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 32), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 32), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) e,
               --年累计
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate >= to_Date('20150101', 'yyyymmdd')
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) a
        
          from xf_smslist) where ROWNUM <= 1;
