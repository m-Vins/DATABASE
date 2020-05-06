/*Sono date le seguenti relazioni (le chiavi primarie sono sottolineate):
STUDENTE(Matricola, Nome, Cognome, CorsoDiLaurea)
LABORATORIO(CodLab, NomeLab, Capienza)
DISPOSITIVO(CodiceDisp, NomeDisp, Tipo, CodLab)
ESPERIMENTO(CodiceDisp, Matricola, Data, Descrizione, Categoria)
Scrivere le seguenti interrogazioni in linguaggio SQL:
(b) Considerando i laboratori presso cui sono stati eseguiti esclusivamente esperimenti svolti
da studenti iscritti al corso di laurea di ’Ingegneria Informatica’, visualizzare, per ogni
laboratorio, codice e nome del laboratorio e la data di ciascun esperimento di categoria
’Elettronica’ effettuato durante il mese di Giugno 2019.*/


SELECT L.CodLab, L.NoeLab, E.data
FROM STUDENTE S,LABORATORIO L, ESPERIMENTO E, DISPOSITIVO D
WHERE E.MAtricola=S.MAtricola AND E.CodDisp=D.CodDisp AND
      D.CodLab=L.CodLab AND E.CodLab NOT IN (
        SELECT E2.CodLab
        FROM LABORTATORIO L2, DISPOSITIVO D2, ESPERIMENTO D2, STUDENTE S2
        WHERE E2.MAtricola=S2.MAtricola AND E2.CodDisp=D2.CodDisp AND
        D2.CodLab=L2.CodLab AND S2.CorsoDiLaurea<>'Ingegneria Informatica'
      ) AND E.Categoria='Elettronica' AND AND E.Data BETWEEN TO_DATE('DD/MM/YYYY','01/06/2019')
        AND TO_DATE('DD/MM/YYYY','31/06/2019')
