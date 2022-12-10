insert into CONVENI_SALE_2018 
select 
    SURVEY_YEAR
    , PF_CODE
    , TOTAL_VALUE
from CONVENIENCE
where SURVEY_YEAR = 2018 
    and KIND_CODE = '100'
    and TOTAL_VALUE is not null
;