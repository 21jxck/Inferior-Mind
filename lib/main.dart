import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyInferiorMind());
}

class MyInferiorMind extends StatelessWidget {
  const MyInferiorMind({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InferiorMind!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Inferior Mind game'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _generateWinningCombination();
    super.initState();
  }

  // imposta il colore dei bottoni inizialmente a grigio
  Color defaultButtonColor1 = Color.fromARGB(221, 95, 92, 92);
  Color defaultButtonColor2 = Color.fromARGB(221, 95, 92, 92);
  Color defaultButtonColor3 = Color.fromARGB(221, 95, 92, 92);
  Color defaultButtonColor4 = Color.fromARGB(221, 95, 92, 92);

  final List<Color> colorList = [
    Color.fromARGB(221, 25, 0, 255),    // blu
    Color.fromARGB(221, 255, 0, 0),     // rosso
    Color.fromARGB(221, 255, 238, 0),   // giallo
    Color.fromARGB(221, 0, 255, 21),    // verde
    Color.fromARGB(221, 255, 255, 255), // bianco
    Color.fromARGB(221, 0, 0, 0),       //nero
  ];

  List<int> indexcolorList = [0,0,0,0];

  List<Color> winningColors = [];

  // metodo che permette il cambio del colore del bottone quando premuto
  void _changeButtonColor(int index) {
    setState(() {
      // controlla l'indice del bottone premuto e imposta come colore di quel bottone quello successivo nella lista
      if(index == 1) defaultButtonColor1 = colorList[indexcolorList[index - 1]];
      else if(index == 2) defaultButtonColor2 = colorList[indexcolorList[index - 1]];
      else if(index == 3) defaultButtonColor3 = colorList[indexcolorList[index - 1]];
      else if(index == 4) defaultButtonColor4 = colorList[indexcolorList[index - 1]];

      // aumenta l'indice della lista dei colori per quel bottone
      indexcolorList[index - 1]++;
      if(indexcolorList[index - 1] > 5) indexcolorList[index - 1] = 0;  // se maggiore di 5 lo riporta all'inizio
    });
  }

  void _generateWinningCombination() {
    // resetta la combinazione vincente
    winningColors.clear();
    Random random = Random();

    // mediante 'Random' crea una combinazione di 4 colori presi da colorList (in modo casuale)
    for (int i = 0; i < 4; i++) {
      int randomIndex = random.nextInt(colorList.length);
      winningColors.add(colorList[randomIndex]);
    }
  }

  // stringa che mostra l'esito finale
  String _win = "Will you guess the right combination?";

  void _checkWin() {
    setState(() {
      _printDebug();  // stampa debug sulla console

      // controlla che tutti i colori dei bottoni combacino con quelli della combinazione vincente
      if (defaultButtonColor1 == winningColors[0] &&
          defaultButtonColor2 == winningColors[1] &&
          defaultButtonColor3 == winningColors[2] &&
          defaultButtonColor4 == winningColors[3]) {
        _win = "YOU WON!";
      } else {
        _win = "You Lost! :(";

        // resetta pulsanti e indici
        defaultButtonColor1 = const Color.fromARGB(221, 95, 92, 92);
        defaultButtonColor2 = const Color.fromARGB(221, 95, 92, 92);
        defaultButtonColor3 = const Color.fromARGB(221, 95, 92, 92);
        defaultButtonColor4 = const Color.fromARGB(221, 95, 92, 92);
        indexcolorList = [0, 0, 0, 0];
      }
    });
  }

  // metodo che stampa i colori vincenti seguiti dalla combinazione di colori inserita
  void _printDebug() {
    print('--- DEBUG ---');
    print('Winning colors:');
    print(winningColors);
    print('Chosen colors:');
    print([
      defaultButtonColor1,
      defaultButtonColor2,
      defaultButtonColor3,
      defaultButtonColor4
    ]);
  }

  // metodo che permette la creazione di una nuova partita
  void _newGame() {
    setState(() {
      _win = "Will you guess the right combination?";
      indexcolorList = [0, 0, 0, 0];
      defaultButtonColor1 = const Color.fromARGB(221, 95, 92, 92);
      defaultButtonColor2 = const Color.fromARGB(221, 95, 92, 92);
      defaultButtonColor3 = const Color.fromARGB(221, 95, 92, 92);
      defaultButtonColor4 = const Color.fromARGB(221, 95, 92, 92);
    });

    // ricreo la combinazione vincente in modo diverso
    _generateWinningCombination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 50, 205, 252),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(221, 50, 80, 252),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // row contenente tutti i bottoni e una stringa che mostra l'esito della partita
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: defaultButtonColor1,
                    minimumSize: Size(72, 72),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () => _changeButtonColor(1),
                  child: const Text(''),
                ),
                const SizedBox(width:70),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: defaultButtonColor2,
                    minimumSize: Size(72, 72),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () => _changeButtonColor(2),
                  child: const Text(''),
                ),
                const SizedBox(width:70),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: defaultButtonColor3,
                    minimumSize: Size(72, 72),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () => _changeButtonColor(3),
                  child: const Text(''),
                ),
                const SizedBox(width:70),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: defaultButtonColor4,
                    minimumSize: Size(72, 72),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () => _changeButtonColor(4),
                  child: const Text(''),
                ),
              ],
            ),
            const SizedBox(height: 70,),
            // stringa mostrante 'YOU WIN!' o 'You Lose! :(' una volta inviata la combinazione scelta
            Text(
              _win,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
          ]
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // pulsante che permette di verificare se la combinazione è corretta
          FloatingActionButton(
            onPressed: _checkWin,
            tooltip: 'Check combination',
            backgroundColor: const Color.fromARGB(255, 102, 21, 253),
            child: const Icon(Icons.done),
          ),
          const SizedBox(width: 16),
          // pulsante che permette di generare una nuova partita
          FloatingActionButton(
            onPressed: _newGame,
            tooltip: 'New Game',
            backgroundColor: Color.fromARGB(255, 255, 187, 0),
            child: const Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}
