import 'package:flutter/material.dart';
import 'package:musical_app/app_utilities/constants.dart';
import 'package:musical_app/app_widgets/quraan_card.dart';
import 'package:musical_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class QuraanApp extends StatelessWidget {
  const QuraanApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    print(context.locale.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.Home).tr(),
        actions: [
          TextButton(
            onPressed: () {
              // change lang to en
              context.setLocale(Locale('en'));
            },
            child: const Text(
              'en',
              style: TextStyle(
                color: kCardBackgroundColor,
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // change lang to en
              context.setLocale(Locale('ar'));
            },
            child: const Text(
              'ar',
              style: TextStyle(
                color: kCardBackgroundColor,
                fontSize: 18,
              ),
            ),
          )
        ],
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
