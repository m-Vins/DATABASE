SELECT COMPANYID,DELIVERERID
FROM COMPANYDEL 
WHERE NUMDELIVERIES>1 AND NUMCOLLECTIONS>2 AND
        DELIVERERID IN (SELECT DELIVERERID
                        FROM DELIVERERS
                        WHERE TOWN = 'Stratford')