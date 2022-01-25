import 'package:flutter/material.dart';
import 'package:musical_app/app_widgets/quraan_card.dart';

class QuraanApp extends StatelessWidget {
  const QuraanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'قرآن بصوت اسلام صبحي',
        ),
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
