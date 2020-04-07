SELECT D.NAME, MIN(P.AMOUNT)
FROM DELIVERERS D, PENALTIES P
WHERE D.DELIVERERID=P.DELIVERERID
GROUP BY D.DELIVERERID , D.NAME
HAVING COUNT(*)>2 AND COUNT(*) <4 