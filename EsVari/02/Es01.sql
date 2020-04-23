SELECT Did,DNome
FROM DIPENDENTE D
WHERE D.Dip IN (SELECT C.Did
                  FROM AEREO A,CERTIFICATO C
                  WHERE C.Aid=A.Aid AND
                        A.DidAutonomia>=5000);
