select 
    age_name as 年齢階層
    , sum(case when time_code = 120 then target_pop else 0 end) as "5時間未満"
    , sum(case when time_code = 130 then target_pop else 0 end) as "5時間以上6時間未満"
    , sum(case when time_code = 140 then target_pop else 0 end) as "6時間以上7時間未満"
    , sum(case when time_code = 150 then target_pop else 0 end) as "7時間以上8時間未満"
    , sum(case when time_code = 160 then target_pop else 0 end) as "8時間以上9時間未満"
    , sum(case when time_code = 170 then target_pop else 0 end) as "9時間以上"
    , sum(case when time_code = 180 then target_pop else 0 end) as 不詳
from sleep_time_dtl
left join age_grp using(age_code)
group by 1
order by age_code
;
