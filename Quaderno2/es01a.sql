/*
Sono date le seguenti relazioni (le chiavi primarie sono sottolineate):
GUIDA (CodGuida, Nome, Cognome, Nazionalit`a)
TIPO-VISITA (CodTipoVisita, Monumento, Durata, Citt`a)
GRUPPO (CodGR, NumeroPartecipanti, Lingua)
VISITA-GUIDATA-EFFETTUATA (CodGR, Data, OraI, CodTipoVisita, CodGuida)
Scrivere le seguenti interrogazioni in linguaggio SQL:
(a) Per ogni guida che non ha mai effettuato visite guidate a gruppi di lingua francesce, visualizzare il nome e il cognome e, per ciascuna data, il numero totale di visite guidate effettuate
e la loro durata complessiva. For each tour guide who has never guided a type of tour for
French-speaking groups, show name and surname
*/


SELECT G.Nome,G.Cognome,COUNT(*),SUM(TV.Durata)
FROM GUIDA G1
    LEFT OUTER JOIN VISITA-GUIDATA-EFFETTUATA  VGE
    ON VGE.CodGuida=G1.CodGuida,TIPO-VISTA TV
WHERE  TV.CodTipoVisita=VGE.CodTipoVisita
      AND G1.CodGuida NOT IN
      (SELECT G2.CodGuida
      FROM GUIDA G2,GRUPPO GR
      WHERE GR.Lingua='Francese' AND G2.CodGR=GR.CodGr)
GROUP BY G.CodGuida,G.Nome, G.Cognome, VGE.data 
