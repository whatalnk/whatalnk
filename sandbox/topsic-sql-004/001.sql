select 
    emp_code as CODE
    , emp_eng_name as ENG_NAME
from emp
where length(emp_eng_name) - length(replace(lower(emp_eng_name), 's', '')) >= 2
order by CODE
;