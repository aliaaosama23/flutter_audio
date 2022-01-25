import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_utilities/constants.dart';
import 'app_widgets/quraan_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: kScaffoldBackgroundColor,
            titleTextStyle: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Cairo',
              color: Color(0xFFFFF5E1),
            ),
          ),
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
        ),
        home: const QuraanApp(),
      ),
    );
  }
}

class QuraanApp extends StatelessWidget {
  const QuraanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kScaffoldBackgroundColor,
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
