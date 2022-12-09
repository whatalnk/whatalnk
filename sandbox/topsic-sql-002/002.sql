select 
    district_code as CODE
    , district_name as NAME
    , total_amt as TOTAL
from population
where 
    total >= 100000 
        and name like '%東%'
order by total desc, code asc
;