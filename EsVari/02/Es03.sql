SELECT D.Did, D.DNome
FROM DIPENDENTI
WHERE D.Did IN (SELECT  C.Did
              FROM CERTIFICATO C, AEREO A
              WHERE A.Autonomia >=5000 AND A.Aid=C.Aid
              GROUP BY C.Did
              HAVING COUNT(*)>=2)
      AND D.Did IN (SELECT C.Did
                    FROM CERTTIFICATO C,AEREO A
                    WHERE A.Aid=C.Aid AND A.Nome='Boeing');
