SELECT DELIVERERID, DATA, AMOUNT
FROM PENALTIES
WHERE (DATA,DELIVERERID) IN (SELECT MAX(DATA), DELIVERERID
                             FROM PENALTIES
                             GROUP BY DELIVERERID
                             HAVING COUNT(*)>=1)
            
            
/**************** OPPURE *************/
SELECT P1.DELIVEREDID, DATA, AMOUNT
FROM PENALTIES P1
WHERE P1.DATA = (SELECT MAX(DATA)
                    FROM PENALTIES P2
                    WHERE P2. DELIVEREDID=P1.DELIVEREDID);