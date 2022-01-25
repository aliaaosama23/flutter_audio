import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_utilities/constants.dart';
import 'app_widgets/quraan_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xFFFFF5E1),
          backgroundColor: Color(0xFF493A58),
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Cairo',
          ),
        ),
      ),
      home: const QuraanApp(),
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
          // style: kAppBarTextStyle,
        ),
        //backgroundColor: kScaffoldBackgroundColor,
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
