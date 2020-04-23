## Dato lo schema relazionale costituito dalle tabelle (le chiavi primarie sono sottolineate):

- AEREO(Aid, ANome, Autonomia)
- CERTIFICATO(Did, Aid)
- DIPENDENTE(Did, DNome, Stipendio)

# esprimere in SQL le seguenti interrogazioni

 -(a) Trovare i codici e i nomi dei dipendenti abilitati al volo su un aereo in grado di coprire distanze
      superiori a 5000 Km (Autonomia≥ 5000).
- (b) Trovare i codici e i nomi dei dipendenti abilitati al volo su almeno due aerei in grado di coprire
      distanze superiori a 5000 Km (Autonomia>= 5000).
- (c) Trovare i codici e i nomi dei dipendenti abilitati al volo su almeno due aerei in grado di coprire
      distanze superiori a 5000 Km e che siano abilitati al volo su qualche Boeing.
