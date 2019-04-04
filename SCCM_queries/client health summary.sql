select name0, lastOnline, LastMPServerName, LastDDR, LastHW, LastSW, LastPolicyRequest, lastactivetime, operating_system_name_and0 from
v_CH_ClientSummary as summary
join v_r_system as sys on sys.resourceid = summary.resourceid
join V_Fullcollectionmembership as fullcollection on fullcollection.resourceid = sys.resourceid
left join V_collection on V_collection.collectionID = fullcollection.collectionid
where v_collection.Name = 'Hospital Support Center - All Workstations (WS OU)'
order by 7

