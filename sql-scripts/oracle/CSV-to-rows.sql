select distinct trim(regexp_substr(value,'[^,]+', 1, level) ) value, level
  from ( select 'A,B,C,D' value from dual
  union all 
  select 'X,Y,Z' value from dual
  union all 
  select 'M,N,O' value from dual)
   connect by regexp_substr(value, '[^,]+', 1, level) is not null
   order by  level;