import 'package:flutter/material.dart';
import 'app_widgets/musical_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MusicApp(),
    );
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF9A0680),
        appBar: AppBar(
          title: const Text(
            'قرآن بصوت اسلام صبحي',
            style: TextStyle(
              color: Color(0xFFFFF5E1),
              fontSize: 25,
            ),
          ),
          backgroundColor: const Color(0xFF9A0680),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return QuranCard(cardNumber: index + 1);
          },
          itemCount: 7,
        )
        // Column(
        //   children:  [
        //     // QuranCard(cardNumber: 1),
        //     // QuranCard(cardNumber: 2),
        //     // QuranCard(cardNumber: 3),
        //     // QuranCard(cardNumber: 4),
        //     // QuranCard(cardNumber: 5),
        //     // QuranCard(cardNumber: 6),
        //
        //   ],
        // ),
        );
  }
}

class QuranCard extends StatelessWidget {
  const QuranCard({Key? key, required this.cardNumber}) : super(key: key);
  final int cardNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xFFFFD39A),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            'سورة النازعات جزء $cardNumber',
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xFF9A0680),
            ),
          ),
        ),
      ),
    );
  }
}
