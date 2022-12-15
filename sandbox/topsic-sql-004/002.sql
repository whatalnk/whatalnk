delete from emp
where emp_code in (
    select emp_code
    from emp_invalid
    left join emp using(emp_code)
    where emp.valid_flg <> '1'
)
;