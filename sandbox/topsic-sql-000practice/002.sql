with 
t as (
    select
        pf_code
        , pf_name
        , round(cast(inp_yes as real) / (inp_yes + inp_no + unidentified) * 100, 1) as r
    from hospitalization
    left join prefecture using(pf_code)
)
select 
    pf_code as 都道府県コード
    , pf_name as 都道府県名
    , r as 入院率
from t
order by 3 desc, 1 asc
;
