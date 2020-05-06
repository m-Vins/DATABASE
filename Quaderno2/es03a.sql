/*RAGAZZO(CodFiscale, Nome, Cognome, DataNascita, Citt`aResidenza)
ATTIVIT`A(CodAttivit`a, NomeA, Descrizione, Categoria)
CAMPO-ESTIVO(CodCampo, NomeCampo, Citt`a)
ISCRIZIONE-PER-ATTIVIT`A-IN-CAMPO-ESTIVO(CodFiscale,CodAttivit`a, CodCampo,
DataIscrizione)
Scrivere le seguenti interrogazioni in linguaggio SQL:
(a) Per ciascun campo estivo presso cui sono iscritti almeno 15 ragazzi per svolgere attivit`a
afferenti ad almeno 3 diverse categorie, visualizzare il nome del campo, la citt`a presso cui
il campo si svolge e per ciascuna attivit`a svolta nel campo il numero di ragazzi che si sono
iscritti*/



SELECT C.NomeCampo, C.Città,A.NomeA,COUNT(*)
FROM ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I,
      CAMPO-ESTIVO C, ATTIVITA A
WHERE C.CodCampo=I.CodCampo AND I.CodAttivita=A.CodAttivita
      AND I.CodCampo IN (SELECT C.CodCampo
                          FROM  (SELECT CI.CodCampo
                                FROM ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I
                                JOIN  CAMPO-ESTIVO C ON C.CodCampo=I.CodCampo AS CI,
                                GROUP BY CI.CodFiscale
                                HAVING COUNT(*)>=15)) AS C,
                                ISCRIZIONE-PER-ATTIVITA-IN-CAMPO-ESTIVO I
                                ATTIVITA A
                          WHERE I.CodAttivita=A.Attività AND I.CodCampo=C.CodCampo
                          GROUP BY C.CodCampo,A.Categoria
                          HAVING COUNT(*)>3)
GROUP BY C.CodCampo,C.NomeCampo, C.Città,A.NomeA,I.CodAttività
