SELECT
DISTINCT(CPU.SystemName0) AS [System Name],
CPU.Manufacturer0 AS Manufacturer,
CPU.Name0 AS Name,
CPU.NumberOfLogicalProcessors0 AS [Logical CPU Count],
COUNT(CPU.ResourceID) AS [Number of CPUs],
CPU.NumberOfCores0 AS [Number of Cores per CPU],
CASE
WHEN VR.Is_Virtual_Machine0 = 1
THEN 'Yes'
ELSE 'No'
END Virtual_Machine
FROM [dbo].[v_GS_PROCESSOR] CPU
INNER JOIN v_R_System VR
ON CPU.ResourceID = VR.ResourceID
GROUP BY
CPU.SystemName0,
CPU.Manufacturer0,
CPU.Name0,
CPU.NumberOfCores0,
CPU.NumberOfLogicalProcessors0,
VR.Is_Virtual_Machine0

order by 5 desc