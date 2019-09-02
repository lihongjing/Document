--导出序列sql
select  'create sequence ' ||SEQNAME||   
        ' minvalue ' ||MINVALUE||
        ' maxvalue ' ||MAXVALUE||
        ' start with ' ||START||
        ' increment by ' ||INCREMENT||
       ( case  when "CACHE"= 0  then  ' nocache'   else   ' cache ' ||CACHE end) || ';'
from SYSCAT.SEQUENCES where SEQNAME ='CC_LEVFIV_HIS_SEQ'

--查询序列
SELECT * FROM SYSCAT.SEQUENCES WHERE SEQNAME ='CC_LEVFIV_HIS_SEQ'

--创建序列
create sequence CC_LEVFIV_COU_SEQ
start with 1
increment by 1
minvalue 1
maxvalue 2147483647
NO CYCLE;

--删除序列
DROP SEQUENCE XFJRCC.CC_LEVFIV_COU_SEQ

--解暂挂
CALL
SYSPROC.ADMIN_CMD('REORG TABLE XFJRCC.CC_LEVFIV_HIS')




--创建唯一索引
CREATE UNIQUE INDEX COU_INDEX ON CC_LEVFIV_COU(CAL_FV,PRE_DATE);
--删除唯一索引
DROP INDEX COU_INDEX

--查看数据库版本
SELECT service_level, fixpack_num FROM TABLE (sysproc.env_get_inst_info());

