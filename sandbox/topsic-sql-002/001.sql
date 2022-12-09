update population 
set district_name = '不明'
from (select district_code from population where district_name is null or district_name = '') t
where population.district_code = t.district_code
;