SELECT C1.DELIVERERID
FROM COMPANYDEL C1
WHERE C1.COMPANYID IN (SELECT C2.COMPANYID
                        FROM COMPANYDEL C2
                        WHERE C2.DELIVERERID='57')
        AND DELIVERERID<>'57' AND C1.COMPANYID
        NOT IN (SELECT C3.COMPANYID
                        FROM COMPANYDEL C3
                        WHERE C3.DELIVERERID<>'57')
        