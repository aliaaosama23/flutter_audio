import 'package:flutter/material.dart';
import 'app_utilities/constants.dart';
import 'app_widgets/musical_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'قرآن بصوت اسلام صبحي',
          style: kAppBarTextStyle,
        ),
        backgroundColor: kScaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return QuranCard(cardNumber: index + 1);
          },
          itemCount: 7,
        ),
      ),
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
              cardNumber: cardNumber,
            ),
          ),
        );
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: kCardBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            'سورة النازعات جزء $cardNumber',
            style: kCardTextStyle,
          ),
        ),
      ),
    );
  }
}
