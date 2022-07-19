with 
t as (
    select 
        pf_code
        , max(case when survey_year = 2015 then total_amt else 0 end) as total_amt_2015
        , max(case when survey_year = 2020 then total_amt else 0 end) as total_amt_2020
    from popu_transition
    group by 1
)
select 
    pf_code as 都道府県コード
    , pf_name as 都道府県名
    , total_amt_2015 as 総人口2015年
    , total_amt_2020 as 総人口2020年
    , round(cast(total_amt_2020 as real) / total_amt_2015 * 100, 0) as 人口増加率
from t 
left join prefecture using(pf_code)
where total_amt_2015 < total_amt_2020
order by 5 desc, 1 asc
;
