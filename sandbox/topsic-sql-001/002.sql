select 
    age_code as 年齢コード
    , age_name as 年齢階層名
    , sum(sp_time_5) as "5時間未満"
    , sum(sp_time_6) as "5時間以上6時間未満"
    , sum(sp_time_7) as "6時間以上7時間未満"
    , sum(sp_time_8) as "7時間以上8時間未満"
    , sum(sp_time_9) as "8時間以上9時間未満"
    , sum(sp_time_9over) as "9時間以上"
from sleep_time_dtl
inner join prefecture using(pf_code)
inner join age_grp using(age_code)
where pf_name in ('北海道', '青森県', '岩手県', '宮城県', '福島県')
group by 1
order by 1 asc
;
