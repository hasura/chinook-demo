
CREATE VIEW [dbo].[EmployeeOrgPermissions] AS
WITH org AS (
    SELECT
        [ReportsTo] as [OrgLeaderId],
        [EmployeeId] as [EmployeeId]
    FROM
        [dbo].[Employee]
    WHERE
        [EmployeeId] IN (
            SELECT
                DISTINCT([EmployeeId])
            FROM
                [dbo].[Employee]
            WHERE [ReportsTo] IS NOT NULL
        )
    UNION ALL
        SELECT
            [OrgLeaderId],
            e.[EmployeeId] as [EmployeeId]
        FROM
            [dbo].[Employee] e
        INNER JOIN org o ON o.[EmployeeId] = e.[ReportsTo]
) SELECT
    *
FROM
   org
UNION
SELECT
    [AdHocManagerId] as [OrgLeaderId],
    [EmployeeId]
FROM [dbo].[AdHocManager]
WHERE [AppliesToOrg] = 0
UNION
SELECT
    ahm.[AdHocManagerId] as [OrgLeaderId],
    o.[EmployeeId]
FROM [dbo].[AdHocManager] ahm
INNER JOIN org o ON o.[OrgLeaderId] = ahm.[EmployeeId]
WHERE [AppliesToOrg] = 1;
