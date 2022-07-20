with 
t as (
    select 
        port_code 
        , sum(case when kind_code = '110' then amt else 0 end) as amt_in
        , sum(case when kind_code = '120' then amt else 0 end) as amt_out
    from immigration
    where group_code = '120' 
    group by 1
)
select 
    port_code as 港コード
    , port_name as 港名
    , amt_in as 入国者数
    , amt_out as 出国者数
    , amt_in - amt_out as 差分
from t 
inner join port using(port_code)
where amt_in > amt_out
order by 5 desc, 1 desc
;
