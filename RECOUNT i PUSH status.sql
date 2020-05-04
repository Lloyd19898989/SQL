--CREATE PROC #dzisOdRana		as		select concat(convert(date,GETDATE()),' 00:00:00.000')
use bojler_prd

select concat(				 																														--IMPORT
cast ((select count(*) from tscm_gsoc_query where error = 1) as int), ' errors,    ',																--IMPORT
cast ((select count(*) from tscm_gsoc_query where done = 1 ) as int), ' done of ',										 							--IMPORT
cast ((select count(*) from tscm_gsoc_query	where error = 0) as int), ' total = ', 																	--IMPORT
cast ((select count(*) from tscm_gsoc_query where done = 1 ) as int) * 100 / cast ((select count(*) from tscm_gsoc_query where error = 0) as int), ' %') as IMPORT		--IMPORT
select value2 as [last import] from vs_config where [value]='tscm'


select concat(																																		--RECOUNT
cast ((select count(*) from tscm_rules_result) as int), ' / ' ,																						--RECOUNT
cast ((select count(*) from tscm_gsoc		) as int),' = ',																						--RECOUNT
	 (((select count(*) from tscm_rules_result)+349) *100 / (select count(*) from tscm_gsoc)), ' % (bo +349)') as RECOUNT											--RECOUNT

	 
select top (1) [data] as [data ostatniego PUSHa dzisiaj] from vs_gsoc_push_logs where [data] > (select concat(convert(date,GETDATE()),' 00:00:00.000')) order by [data] desc 			--PUSH
select datediff(MILLISECOND,																																							--PUSH
(select [data] as ms from vs_gsoc_push_logs where [data] > (select concat(convert(date,GETDATE()),' 00:00:00.000')) order by [data] desc offset 2 row fetch next 1 rows only),			--PUSH
(select top (1) [data] as [data ostatniego PUSHa] from vs_gsoc_push_logs where [data] > (select concat(convert(date,GETDATE()),' 00:00:00.000')) order by [data] desc)) as miliseconds	--PUSH
select count(*) as [PUSH LOGs] from vs_gsoc_push_logs where [data] > (select concat(convert(date,GETDATE()),' 00:00:00.000'))  													--PUSH

select count(*) as [assignedTeam = NULL] from tscm_gsoc where assignedTeam is null and testState='failed'

select product, count(*) as [Client = Tech PL & assignedTeam = Client] from tscm_gsoc where assignedTeam = 'client' and client='tech pl' group by product order by product desc

select policyname as [policyName with no Environment], count(*) as ile from tscm_gsoc where environment = '' group by policyname order by ile desc

