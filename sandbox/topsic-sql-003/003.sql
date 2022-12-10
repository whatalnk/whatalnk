with t as (
select 
    CLASS_NAME as CLASS
    , CLASS_CODE
    , PERSON_NAME as PERSON
    , amt as HOUSEHOLDS
    , row_number() over(partition by class_code order by amt desc) as amt_order
from HOUSEHOLD
where 
    PERSON_CODE <> '1'
    and CLASS_CODE <> '01'
)
select 
    CLASS
    , PERSON
    , HOUSEHOLDS
from t 
where amt_order = 1
order by class_code 
;