/*CORSO (CodCorso, NomeC, Anno, Semestre)
 *ORARIO-LEZIONI (CodCorso,GiornoSettimana,OraInizio,OraFine,Aula)
 */
 
/*TROVARE LE AULE IN CUI NON SI TENGONO MAI LEZIONI
 * DI CORSI DEL PRIMO ANNO
 */
  
SELECT DISTINCT OL1.Aula
FROM ORARIO-LEZIONI OL1
WHERE OL1.Aula NOT IN (SELECT OL.Aula
					FROM ORARIO-LEZIONI OL2,CORSO C
					WHERE C.Anno=1 AND OL2.CodCorso=C.CodCorso)
					
/*	
 *	OPPURE
*/

WHERE NOT EXIST(SELECT *
				FROM ORARIO-LEZIONI OL2,CORSO C
				WHERE C.Anno=1 AND OL.CodCorso=C.CodCorso
						AND OL1.Aula=OL2.Aula) /* <-- condizione di correlazione*/
