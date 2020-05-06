/*Sono date le seguenti relazioni (le chiavi primarie sono sottolineate):
STUDENTE(Matricola, Nome, Cognome, CorsoDiLaurea)
LABORATORIO(CodLab, NomeLab, Capienza)
DISPOSITIVO(CodiceDisp, NomeDisp, Tipo, CodLab)
ESPERIMENTO(CodiceDisp, Matricola, Data, Descrizione, Categoria)
Scrivere le seguenti interrogazioni in linguaggio SQL:
(a) Per ogni dispositivo che `e stato utilizzato in almeno 10 esperimenti, visualizzare il nome
del dispositivo, il nome del laboratorio presso cui il dispositivo `e collocato e, per ciascun
studente che ha utilizzato il dispositivo, il numero di esperimenti eseguiti dallo studente
con quel dispositivo.*/


SELECT D.NomeDisp,L.NomeLab,COUNT(*)
FROM ESPERIMENTO E, (SELECT D2.CodiceDIsp, D2.NomeDisp
                      FROM DISPOSITIVO D2 JOIN ESPERIMENTO E2
                      ON D2.CodiceDisp=E2.CodiceDisp
                      GROUP BY D2.CodiceDisp
                      HAVING COUNT(*)>=10) AS D,
    LABORATORIO L, STUDENTE S
WHERE E.CodiceDisp=D.CodiceDisp AND D.CodLab=L.CodLab
AND S.Matricola=E.Matricola
GROUP BY D.NomeDisp,L.NomeLab,E.Matricola
