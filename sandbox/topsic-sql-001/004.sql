with 
t as (
    select 
        pf_code
        , rank() over(partition by pf_code order by amt desc, nation_code asc) as rank_amt
        , amt
        , nation_code
    from foreigner
    where nation_code <> '113'
)
select 
    pf_code as 都道府県コード
    , pf_name as 都道府県名
    , max(case when rank_amt = 1 then amt else 0 end) as "1位 人数"
    , max(case when rank_amt = 1 then nation_name else '' end) as "1位 国名"
    , max(case when rank_amt = 2 then amt else 0 end) as "2位 人数"
    , max(case when rank_amt = 2 then nation_name else '' end) as "2位 国名"
    , max(case when rank_amt = 3 then amt else 0 end) as "3位 人数"
    , max(case when rank_amt = 3 then nation_name else '' end) as "3位 国名"
    , sum(amt) as 合計人数
from t 
inner join nationality using(nation_code)
inner join prefecture using(pf_code)
group by 1
order by 9 desc, 1 asc
;
