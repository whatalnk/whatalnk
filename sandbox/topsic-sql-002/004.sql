with 
agg as (
    select 
        survey_year
        , pf_code
        , '小学校' as kind 
        , sum(elementary) as amt
        , 1 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
    union all 
    select 
        survey_year
        , pf_code
        , '中学校' as kind 
        , sum(middle) as amt
        , 2 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
    union all 
    select 
        survey_year
        , pf_code
        , '高校' as kind 
        , sum(high) as amt
        , 3 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
    union all 
    select 
        survey_year
        , pf_code
        , '短大' as kind 
        , sum(junior_clg) as amt
        , 4 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
    union all 
    select 
        survey_year
        , pf_code
        , '大学' as kind 
        , sum(college) as amt
        , 5 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
    union all 
    select 
        survey_year
        , pf_code
        , '大学院' as kind 
        , sum(graduate) as amt
        , 6 as kind_order
    from enrollment_status
    where survey_year = 2020
    group by survey_year, pf_code
)
select 
    survey_year as SV_YEAR
    , pf_name as PREFECTURE
    , kind as KIND
    , amt as AMT
from agg
left join prefecture using(pf_code)
where amt is not null
order by pf_code, kind_order
;