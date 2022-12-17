with 
recursive dates(dt) as (
    values('2022-08-01')
    union all
    select 
        date(dt, '+1 day')
    from dates
    where dt < '2022-08-31'
)
, agg as (
    select
        strftime('%Y-%m-%d', confirmed_at) as dt
        , count(user_code) as ttl
    from users 
    where 
        dt between date('2022-08-01') and date('2022-08-31') 
        and valid_flg = '1'
    group by dt
) 
select 
    dt as REGIST_DATE
    , case 
        when strftime('%w', dt) = '0' then '日'
        when strftime('%w', dt) = '1' then '月'
        when strftime('%w', dt) = '2' then '火'
        when strftime('%w', dt) = '3' then '水'
        when strftime('%w', dt) = '4' then '木'
        when strftime('%w', dt) = '5' then '金'
        else '土'
        end as WK
    , coalesce(ttl, 0) as TOTAL 
from dates
left join agg using(dt)
order by REGIST_DATE
;