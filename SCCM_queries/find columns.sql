Select distinct table_name,COLUMN_NAME From Information_Schema.columns 
where table_name LIKE ('v%') 
and column_name like '%virtual%'
Order by table_name