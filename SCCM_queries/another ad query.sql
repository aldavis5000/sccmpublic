select samaccountname as 'sam', displayname, description as 'descript', givenname as 'firstname', sn as 'lastname', department as 'dept'
into #ad
from Lifevwpdbs01.[Canary ].[dbo].[tblADUser]

SELECT Time as 'Time'
      ,Component
      ,REPLACE(InsString1,'lpnt\','') as 'controlled_by'
      ,InsString2 as 'remote_controlled_from'
      ,InsString3 as 'Computer_Being_Remote_Controlled'
	 into #sccmdata
  FROM v_StatMsgWithInsStrings
  where messageid = '30076'
  and component = 'Remote Control Viewer'
  and time BETWEEN DATEADD(dd,-30,GETDATE()) AND DATEADD(dd,30,GETDATE())
  order by 1 desc

select #sccmdata.time as 'Time',#sccmdata.remote_controlled_from as 'remote controlled from',#ad.sam as 'controlled by',#ad.firstname as 'controlled by first',#ad.lastname as 'controlled by last', #sccmdata.Computer_Being_Remote_Controlled
from #sccmdata
join #ad on #ad.sam = #sccmdata.controlled_by
order by 1 desc
drop table #sccmdata
drop table #ad
