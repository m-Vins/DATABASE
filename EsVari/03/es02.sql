SELECT DISTINCT CODS
FROM CALENDARIO
WHERE CODD IN (SELECT CODD
                FROM COMPETENZE
                GROUP BY CODD
                HAVING COUNT(*)=SELECT MAX(TOTALECOMP)
                        FROM  (SELECT CODD,COUNT(*) AS TOTALECOMP
                                FROM COMPETENZE
                                GROUP BY CODD) AS TOTALIC)
