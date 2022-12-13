with 
entried as (
    select 
        entry_id
        , user_id
        , started_at
    from entries
    where contest_id = 2
)
, valid_submissions as (
    select 
        submit_id
        , contest_id
        , problem_id
        , entried.user_id
        , entry_id
        , submitted_at
        , status
        , point
        , started_at
    from entried
    left join submissions using(entry_id)
    where
        contest_id = 2
)
, valid_submissions_ac as (
    select 
        entry_id
        , problem_id
        , min(submitted_at) as first_ac_at
        , max(submitted_at) as last_ac_at
    from valid_submissions
    where status = 'AC'
    group by entry_id, problem_id
)
, base as (
    select 
        submit_id
        , contest_id
        , problem_id
        , user_id
        , entry_id
        , submitted_at
        , status
        , point
        , started_at
        , first_ac_at
        , last_ac_at
        , unixepoch(last_ac_at) - unixepoch(started_at) as last_ac_in_epoch
    from valid_submissions
    left join valid_submissions_ac using(entry_id, problem_id)
)
, agg_by_problem as (
    select
        entry_id
        , problem_id
        , sum(case when submitted_at < first_ac_at then 1 else 0 end) as problem_wrong_ans
        , sum(point) as problem_point
        , max(last_ac_in_epoch) as problem_last_ac_in_epoch
    from base
    group by entry_id, problem_id
)
, agg as (
    select
        entry_id
        , sum(problem_wrong_ans) as wrong_ans
        , sum(problem_point) as point
        , max(problem_last_ac_in_epoch) as last_ac_in_epoch
    from agg_by_problem
    group by entry_id
)
select 
    rank() over(order by point desc, ex_time) as RANK
    , user_id as USER_ID
    , point as POINT
    , ex_time as EX_TIME
    , wrong_ans as WRONG_ANS
from(
    select
        user_id
        , point
        , last_ac_in_epoch + 300 * wrong_ans as ex_time
        , wrong_ans
    from agg 
    left join entried using(entry_id)
    where point > 0
)
;
