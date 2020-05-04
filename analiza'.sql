use bojler_prd

select distinct date_in, testname, (
	select top (20) count(*) as ee from tscm_archive as subquery where subquery.date_in=query.date_in and subquery.testName=query.testName
	having count(*) > 200 order by ee desc	) as ile
from tscm_archive as query where testState = 'failed' and date_in in ('2020-04-01', '2020-04-02', '2020-04-03', '2020-04-06', '2020-04-07')
order by date_in desc, ile desc 
