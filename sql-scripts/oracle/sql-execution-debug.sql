-- Get Average execution time for sql statements
SELECT
sql_text, 
ceil(cpu_time/greatest(executions,1) ) ave_cpu_time, 
ceil(elapsed_time/greatest(executions,1)) ave_elapsed_time,
ceil(disk_reads/greatest(executions,1)) ave_disk_reads,
ceil(plsql_exec_time/greatest(executions,1)) ave_plsql_exec_time,
ceil(concurrency_wait_time/greatest(executions,1)) ave_concurrency_wait_time,
ceil(user_io_wait_time/greatest(executions,1)) ave_user_io_wait_time,
ceil(application_wait_time/greatest(executions,1)) ave_application_wait_time ,
--persistent_mem per_mem, runtime_mem run_mem, 
ceil(sorts/greatest(executions,1)) ave_sorts, 
ceil(parse_calls/greatest(executions,1)) ave_parse_calls,
ceil(Buffer_gets/greatest(executions,1)) ave_buffer_gets,
ceil(rows_processed/greatest(executions,1)) ave_row_proc,
ceil(Serializable_aborts/greatest(executions,1)) ave_ser_aborts
FROM
v$sqlarea
WHERE parsing_schema_name like '%SCPAY%'
--WHERE
--Disk_reads/greatest(executions,1)>disk_reads
--OR
--Cpu_time/greatest(executions,1)>cpu_time
--OR
--Elapsed_time/greatest(executions,1)>elapsed_time
--order by ave_elapsed_time desc , ave_cpu_time desc , ave_disk_reads desc
order by elapsed_time desc , cpu_time desc , disk_reads desc ;
--where rownum<11



SELECT B.Owner, B.Object_Name, A.Oracle_Username, A.OS_User_Name  
FROM V$Locked_Object A, All_Objects B
WHERE A.Object_ID = B.Object_ID ;

select
   c.owner,
   c.object_name,
   c.object_type,
   b.sid,
   b.serial#,
   b.status,
   b.osuser,
   b.machine , 
   b.*
from
   v$locked_object a ,
   v$session b,
   dba_objects c
where
   b.sid = a.session_id
and
   a.object_id = c.object_id;
   
   
   
   select * from v$parameter ;
   
   
   select * from V$SYSTEM_EVENT  where rownum < 10 order by TOTAL_WAITS desc;
   
   select * from V$SYSTEM_EVENT order by TOTAL_WAITS desc;
   
   
   select CASE METRIC_NAME
WHEN 'SQL Service Response Time' then 'SQL Service Response Time (secs)'
WHEN 'Response Time Per Txn' then 'Response Time Per Txn (secs)'
ELSE METRIC_NAME
END METRIC_NAME,
CASE METRIC_NAME
WHEN 'SQL Service Response Time' then ROUND((MINVAL / 100),2)
WHEN 'Response Time Per Txn' then ROUND((MINVAL / 100),2)
ELSE MINVAL
END MININUM,
CASE METRIC_NAME
WHEN 'SQL Service Response Time' then ROUND((MAXVAL / 100),2)
WHEN 'Response Time Per Txn' then ROUND((MAXVAL / 100),2)
ELSE MAXVAL
END MAXIMUM,
CASE METRIC_NAME
WHEN 'SQL Service Response Time' then ROUND((AVERAGE / 100),2)
WHEN 'Response Time Per Txn' then ROUND((AVERAGE / 100),2)
ELSE AVERAGE
END AVERAGE
from 
   SYS.V_$SYSMETRIC_SUMMARY 
where METRIC_NAME in ('Database CPU Time Ratio')
ORDER BY 1;


select 
   to_char(begin_time, 'dd-hh24') || ':00' as hour,
   round(avg(maxval))                     as maxval,
   round(avg(average))                     as average
from 
   dba_hist_sysmetric_summary
where 
   metric_id = 2108
and 
   begin_time >= sysdate - 1
group by 
   to_char(begin_time, 'dd-hh24') || ':00'
order by 1;

select 
   metric_name,
   value
from 
   SYS.V_$SYSMETRIC
where 
   METRIC_NAME IN 
      ('Database CPU Time Ratio')
and
INTSIZE_CSEC =
(select max(INTSIZE_CSEC) from SYS.V_$SYSMETRIC);





select to_char ( end_time , 'YYYY-MM-DD HH24:MI' )
      ,round((db_cpu_consumption/( case when dbtime = 0 then 1 else dbtime end ) )*100) db_cpu_time_ratio
    from(
         select end_time as end_time
               ,sum(case when metric_name='Database Time Per Sec' then cpu_usage end) as dbtime
               ,sum(case when metric_name='CPU Usage Per Sec' then cpu_usage end) as db_cpu_consumption
             from(select end_time,metric_name,round(value) cpu_usage
                      from v$sysmetric_history
                      where metric_name in('CPU Usage Per Sec','Database Time Per Sec')
                 )
             group by end_time
        )
    order by end_time desc ;
    
    select to_char ( end_time , 'YYYY-MM-DD HH24:MI:ss' ) ,hist.*
from sys.v_$sysmetric_history hist
where metric_name in ( 'Database CPU Time Ratio' , 'Host CPU Utilization (%)' , 'Database Wait Time Ratio' )
order by 1 desc ;



select * from V$SESSION ;


select * from V$SESSION_WAIT_HISTORY ;


select * from V$SYSTEM_WAIT_CLASS ;