select '�̳�������������' || round(f / 10000, 1) || '��Ԫ��ȫ������' ||
       round(g / 10000, 1) || '��Ԫ��ȫ�ݵ����ۼ�����' || round(b / 10000, 1) ||
       '��Ԫ��ͬ������' || round((b - d) / d * 100, 1) || '%����������' ||
       round((b - e) / e * 100, 1) || '%,ȫ�ݵ����ۼ�����' || round(a / 10000, 1) ||
       '��Ԫ��'||chr(10)||'ǰһ��' || (t1) || ';ǰһ��ͬ��' || (t2) || ';��һ��' || (t3) || '��'
 from (select telephone z,
               --��
               --��Ӧǰһ��
               (select to_char((sysdate - 1), 'yyyy-mm-dd') from dual) t1,
               --��Ӧǰһ��ͬ��ͬ��
               (select to_char((sysdate - 366), 'yyyy-mm-dd') from dual) t2,
               --��Ӧ��һ��ͬ��
               (select to_char((sysdate - 32), 'yyyy-mm-dd') from dual) t3,
               --��ȡǰһ������(select to_char((sysdate-1),'yyyymmdd') from dual ),'yyyymmdd')
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
               --���ۼ�
               --ÿ����ͷ����β
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 1), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) b,
               --ǰһ��ͬ�±Ƚϣ���ΧΪ�뵱���������ǰһ��������ͬ����ݲ�ͬ
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 366), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 366), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) d,
               --��һ���±Ƚϣ���ΧΪ��һ���µ���ͷ����β
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where to_char(xf_Txdate, 'yyyymm') >=
                       (select to_char((sysdate - 32), 'yyyymm') from dual)
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 32), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) e,
               --���ۼ�
               (select sum(xf_amtsold)
                  from xf_transsalesitem
                 where xf_Txdate >= to_Date('20150101', 'yyyymmdd')
                   and xf_Txdate <=
                       to_date((select to_char((sysdate - 1), 'yyyymmdd')
                                 from dual),
                               'yyyymmdd')) a
        
          from xf_smslist) where ROWNUM <= 1;
