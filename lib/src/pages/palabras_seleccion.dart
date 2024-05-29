
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/me_gusta.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current; 

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 120, 82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.network('https://upload.wikimedia.org/wikipedia/commons/7/7d/Logo_Letras.mus.br.png'),
            Image.asset('assets/logo.png'),
            Text('Ideas asombrosas de forma aleatoria:'),
            BigCard(pair: pair.asLowerCase),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                ElevatedButton.icon(
                  icon: Icon(icon),
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  label: Text('Me Gusta'),
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final String pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        // ↓ Change this line.
        child: Text(pair.toLowerCase(), 
        style: style,
        //semanticsLabel: "${pair.first} ${pair.second}"
        ),
        
      ),
    );
  }
}