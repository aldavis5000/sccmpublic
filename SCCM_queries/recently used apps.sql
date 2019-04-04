select sys.name0, recent.companyname0, ExplorerFileName0, FileDescription0, FolderPath0, lastusedtime0, lastusername0, productname0, ProductVersion0 from v_r_system sys
join v_GS_CCM_RECENTLY_USED_APPS recent on recent.resourceid = sys.resourceid
where sys.name0 = 'ACMCVWPEPO01'
and folderpath0 not like 'c:\windows\%'
