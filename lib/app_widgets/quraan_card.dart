import 'package:flutter/material.dart';
import 'package:musical_app/app_utilities/constants.dart';

import 'musical_card.dart';

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
