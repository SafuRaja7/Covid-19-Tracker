import 'package:covid_tracker/screens/global_data.dart';
import 'package:covid_tracker/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const Splash(),
          '/global_data': (context) => const GlobalDataScreen(),
        });
  }
}
