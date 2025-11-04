# GIOCO INFERIOR MIND

## DESCRIZIONE ---
Gioco Inferior Mind: una versione molto semplificata del gioco **Master mind**

## FUNZIONAMENTO --
Il gioco *Inferior Mind* consiste nell'indovinare una sequenza di 4 colori generata casualmente.

La lista di colori possibili è:
- 🔵 Blu,
- 🔴 Rosso,
- 🟡 Giallo,
- 🟢 Verde,
- ⚪ Bianco,
- ⚫ Nero.

Si può decidere la sequenza tramite una serie di **pulsanti cliccabili**: ogni volta che un pulsante viene premuto cambia colore. Una volta decisa la sequenza giusta, si può premere il *pulsante in basso a sinistra* (con un icona ✅) e si può verificare se la combinazione inserita è corretta. Un messaggio comparirà al *centro dello schermo* indicando l'esito della partita.

Vi è inoltre un ultimo bottone in basso a destra (con icona 🔄️) che serve per *creare una nuova partita* con una **combinazione di colori da indovinare differente** rispetto alla scorsa.

## STRUTTURA DEL CODICE 
Il programma si basa sulla classe **MyInferiorMind** che estende uno **stateless widget** (widget che non cambia) e genera lo "*scheletro*" della pagina.
E sulla classe **MyHomePage** che gestisce la logica del gioco tramite i vari metodi:\
• **changeButtonColor** => gestisce il cambio del colore del pulsante quando premuto.\
• **generateWinningCombination** => crea la combinazione randomica da indovinare.\
• **checkWin** => verifica se la combinazione inserita e quella da indovinare sono uguali, se si l'Utente vince, altrimenti può ritentare\
• **printDebug** => stampa sulla console la combinazione vincente e quella scelta per test/debug\
• **newGame** => crea una nuova partita da 0 (nuova combinazione da indovinare, resetta i colori)\
• **build** => gestisce l'interfaccia grafica del programma, ritornando una scaffold contenente un body con tutti i pulsanti e le stringhe visualizzabili.\

## REQUISITI DELL'APP
I requisiti per poter eseguire il progetto sono i seguenti:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installato (cliccarlo per essere reindirizzati al sito per l'installazione),
- **Dart SDK** incluso con Flutter,
- Un editor (es. **Android Studio**),
- Un emulatore o dispositivo fisico per testare l’applicazione.

## ALL'AVVIO
Dopo aver clonato o copiato il progetto, si deve eseguire nel terminale integrato:

```bash
flutter pub get
flutter run
```
## AUTORE
Sviluppo del progetto a cura di **Jacopo Olivo**, 5IB ITIS C. Zuccante - TPSIT 2025/26