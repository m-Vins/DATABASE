/*RAGAZZO(CodFiscale, Nome, Cognome, DataNascita, Citt`aResidenza)
ATTIVIT`A(CodAttivit`a, NomeA, Descrizione, Categoria)
CAMPO-ESTIVO(CodCampo, NomeCampo, Citt`a)
ISCRIZIONE-PER-ATTIVIT`A-IN-CAMPO-ESTIVO(CodFiscale,CodAttivit`a, CodCampo,
DataIscrizione)

(b) Per ogni ragazzo nato prima del 2005 ed iscritto ad attivit`a presso almeno 3 campi estivi,
visualizzare nome e cognome del ragazzo e il nome di ciascun campo in cui il ragazzo `e
iscritto a tutte le diverse attivit`a organizzate dal campo*/


SELECT R.Nome,R.Cognome,CE.NomeCampo
FROM ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I, CAMPO-ESTIVO CE,
RAGAZZO R, ATTIVITA A
WHERE R.CodFiscale=I.CodFiscale AND I.CodCampo=CE.CodCampo AND
      A.CodAttivita=I.CodAttivita AND I.CodFiscale IN (SELECT I2.CodFiscale
                            FROM RAGAZZO R2,ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I2
                            WHERE  I2.CodFiscale=R2.CodFiscale AND
                                  R2.DataNascita<TO_DATE('dd/mm/yyyy','01/01/2005')
                            GROUP BY I2.CodFiscale
                            HAVING COUNT(I2.CodCampo)>3)
      AND CE.CodCampo IN (SELECT I1.CodCampo
                            FROM ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I1
                            WHERE I1.CodFiscale=I.CodFiscale
                            GROUP BY I1.CodFiscale,I1.CodCampo
                            HAVING COUNT(*)=MAX(SELECT COUNT(*)
                                                FROM ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I2
                                                GROPU BY I2.CodFiscale,I2.CodCampo))

/*non sono
