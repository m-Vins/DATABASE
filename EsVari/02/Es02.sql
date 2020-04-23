SELECT Did,Dnome
FROM DIPENDENTI
WHERE Did IN (SELECT  C.Did
              FROM CERTIFICATO C, AEREO A
              WHERE A.Autonomia >=5000 A.Aid=C.Aid
              GROUP BY C.Did
              HAVING COUNT(*)>=2)
