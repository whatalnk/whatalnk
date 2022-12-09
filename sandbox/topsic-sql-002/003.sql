with 
drink as (
    select 
        pf_code
        , sum(case when category_code = '120' then amt else 0 end) as sum_amt
        , sum(case when category_code = '110' then amt else 0 end) as total_amt
    from drink_habits
    where gender_code in ('2', '3')
    group by pf_code
)
select 
    pf_code as CODE
    , pf_name as NAME
    , round(cast(sum_amt as real) / total_amt * 100, 1) as PERCENTAGE
from drink
left join prefecture using(pf_code)
order by percentage desc, code desc
;