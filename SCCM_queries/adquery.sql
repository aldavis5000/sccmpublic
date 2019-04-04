select samaccountname as 'sam', displayname, description as 'descript', givenname as 'firstname', sn as 'lastname', department as 'dept'
into #ad
from Lifevwpdbs01.[Canary ].[dbo].[tblADUser]

select  sys.Netbios_Name0 as 'computer',
REPLACE(SCUM.TopConsoleUser0,'lpnt\','') as 'topuser', sys.Operating_System_Name_and0 as 'OS'
 into #sccmdata
 from v_R_System_Valid sys
join V_Fullcollectionmembership as fullcollection on fullcollection.resourceid = sys.resourceid
left join V_collection on V_collection.collectionID = fullcollection.collectionid
LEFT OUTER JOIN dbo.v_GS_SYSTEM_CONSOLE_USAGE_MAXGROUP SCUM ON sys.ResourceID = SCUM.ResourceID 
where V_collection.Name = 'All Laptops in HSC'
order by 1

select #sccmdata.computer,#ad.sam as '3/4',#ad.dept, #ad.firstname,#ad.lastname,#ad.descript, #sccmdata.OS
from #sccmdata
join #ad on #ad.sam = #sccmdata.topuser
order by 4
drop table #sccmdata
drop table #ad