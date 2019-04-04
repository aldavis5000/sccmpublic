SELECT DISTINCT CategoryName AS 'Publisher', FamilyName AS 'Family', Tag1Name AS 'Type', Tag2Name AS 'Version', SUM(Count) AS Total
FROM v_LU_SoftwareList_Editable SL
WHERE Tag3ID IS NOT NULL
GROUP BY CategoryName, FamilyName, Tag1Name, Tag2Name, Tag3Name
ORDER BY Total DESC