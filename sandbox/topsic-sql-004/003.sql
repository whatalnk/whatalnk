with 
valid_data as (
    select 
        total_value
    from convenience
    where 
        survey_year = 2019
        and kind_code = '100'
)
select 
round(avg(cast(total_value as real))) as SA_MEDIAN
from (
    select 
        total_value
    from valid_data
    order by total_value
    limit 2 - (select count(1) from valid_data) % 2
    offset (select (count(1) - 1) / 2 from valid_data)
)
;