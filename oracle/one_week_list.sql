select 'ǰһ��:' || (t) || '--ȫ������Ϊ' ||round(g0 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t1) || '--ȫ������Ϊ' ||round(g / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t2) || '--ȫ������Ϊ' ||round(g1 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t3) || '--ȫ������Ϊ' ||round(g2 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t4) || '--ȫ������Ϊ' ||round(g3 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t5) || '--ȫ������Ϊ' ||round(g4 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t6) || '--ȫ������Ϊ' ||round(g5 / 10000, 1) || '��Ԫ��'
||chr(10)||'ǰ����:' || (t7) || '--ȫ������Ϊ' ||round(g6 / 10000, 1) || '��Ԫ��'
 from (select telephone z,
               --��
               --��Ӧǰһ��
               (select to_char((sysdate - 1), 'yyyy-mm-dd') from dual) t,
               (select to_char((sysdate - 2), 'yyyy-mm-dd') from dual) t1,
               (select to_char((sysdate - 3), 'yyyy-mm-dd') from dual) t2,
               (select to_char((sysdate - 4), 'yyyy-mm-dd') from dual) t3,
               (select to_char((sysdate - 5), 'yyyy-mm-dd') from dual) t4,
               (select to_char((sysdate - 6), 'yyyy-mm-dd') from dual) t5,
               (select to_char((sysdate - 7), 'yyyy-mm-dd') from dual) t6,
               (select to_char((sysdate - 8), 'yyyy-mm-dd') from dual) t7,
               --��ȡǰһ������(select to_char((sysdate-1),'yyyymmdd') from dual ),'yyyymmdd')
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
