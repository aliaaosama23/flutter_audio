import 'package:flutter/material.dart';
import 'app_utilities/constants.dart';
import 'app_widgets/quraan_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuraanApp(),
    );
  }
}

class QuraanApp extends StatelessWidget {
  const QuraanApp({Key? key}) : super(key: key);

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
          itemCount: 14,
        ),
      ),
    );
  }
}
