/*Sono date le seguenti relazioni (le chiavi primarie sono sottolineate):
GUIDA (CodGuida, Nome, Cognome, Nazionalit`a)
TIPO-VISITA (CodTipoVisita, Monumento, Durata, Citt`a)
GRUPPO (CodGR, NumeroPartecipanti, Lingua)
VISITA-GUIDATA-EFFETTUATA (CodGR, Data, OraI, CodTipoVisita, CodGuida)
Scrivere le seguenti interrogazioni in linguaggio SQL:

(b) Tra i monumenti per cui sono state effettuate almeno 10 visite guidate, visualizzare il monumento che `e stato visitato complessivamente dal maggior numero di persone. Among the
monuments for which at least 10 guided tours have been carried out, show the monuments
visited by the greatest number of participants.*/

/*NON SO SE E' GIUSTO*/
SELECT TV.Monumento
FROM TIPO-VISITA TV, GRUPPO GR, VISITA-GUIDATA-EFFETTUATA VGE
WHERE VGE.CodGR=GR.CodGR AND TV.CodTipoVisita=VGE.CodTipoVisita
GROUP BY TV.Monumento
HAVING COUNT(*)>10 AND MAX(SUM(GR.NumeroPartecipanti))
