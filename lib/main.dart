import 'package:flutter/material.dart';
import 'app_widgets/musical_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MusicApp(),
    );
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قرآن بصوت اسلام صبحي'),
      ),
      body: Column(
        children: const [
          QuranCard(cardNumber: 1),
          QuranCard(cardNumber: 2),
          QuranCard(cardNumber: 3),
          QuranCard(cardNumber: 4),
          QuranCard(cardNumber: 5),
          QuranCard(cardNumber: 6),
          QuranCard(cardNumber: 7),
        ],
      ),
    );
  }
}

class QuranCard extends StatelessWidget {
  const QuranCard({Key? key, required this.cardNumber}) : super(key: key);
  final int cardNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicalCard(
                cardColor: Colors.black54,
                cardNumber: cardNumber,
              ),
            ),
          );
        },
        child: Container(
          color: Colors.black54,
          child: Center(
            child: const Text(
              'سوره النازعات',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
