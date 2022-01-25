import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_utilities/constants.dart';
import 'app_widgets/quraa_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
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
    );
  }
}
