SELECT D.DELIVERERID
FROM DELIVERERS D
WHERE YEAR_OF_BIRTH>1962 AND 
        D.DELIVERERID IN (SELECT DELIVERERID
                        FROM COMPANYDEL C
                        WHERE C.NUMDELIVERIES>1 AND 
                        C.COMPANYID IN (SELECT CO.COMPANYID
                                        FROM COMPANIES CO
                                        WHERE CO.MANDATE='first'))
ORDER BY D.DELIVERERID DESC
                                        