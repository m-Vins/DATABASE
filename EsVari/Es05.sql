SELECT V.Sigla,O.OraPart
FROM VOLI V, ORARIO O, AEREI A
WHERE V.Sigla=O.Sigla AND V.Matr=A.Matr
		AND V.Data=TO_DATE(01/10/1993) AND A.NumPosti>V.PostiPren
		AND O.ParteDa='Milano' AND O.Destinaz='Napoli'
		AND (O.OraArr-O.OraPart)<(SELECT AVG(OraArr-OraPart)
									FROM ORARIO
									WHERE ParteDa='Milano' AND Destinaz='Napoli')
									