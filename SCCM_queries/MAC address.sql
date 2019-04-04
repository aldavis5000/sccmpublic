SELECT sys.resourceid, sys.name0, dbo.v_RA_System_MACAddresses.MAC_Addresses0
FROM dbo.v_R_System as sys
 RIGHT OUTER JOIN dbo.v_RA_System_MACAddresses ON sys.ResourceID = dbo.v_RA_System_MACAddresses.ResourceID 
where dbo.v_RA_System_MACAddresses.MAC_Addresses0 = '18:DB:F2:54:18:67'
