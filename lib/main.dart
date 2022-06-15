import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
<<<<<<< HEAD
import 'package:covid_tracker/models/global.dart';
import 'package:covid_tracker/providers/nav_bar_provider.dart';
=======
import 'package:covid_tracker/providers.dart';
>>>>>>> dd752f8d650f86756df97890b0c62f95aeecd737

import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/screens/dashboard.dart';
import 'package:covid_tracker/screens/splash.dart';
import 'package:covid_tracker/widgets/nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<Covid>(
    CovidAdapter(),
  );

  Hive.openBox('app');
  Hive.openBox('globalBox');
  Hive.openBox('countriesBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.cyan,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        ),
        BlocProvider(
          create: (context) => CovidCubit(),
        ),
        BlocProvider(
          create: (context) => CountriesdataCubit(),
        ),
<<<<<<< HEAD
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
=======
>>>>>>> dd752f8d650f86756df97890b0c62f95aeecd737
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const Splash(),
          '/global_data': (context) => const GlobalDataScreen(),
          '/countries_screen': (context) => const CountriesScreen(),
          '/countries_data_screen': (context) => const CountriesDataScreen(),
          '/nav_bar': (context) => const BottomNavBar(),
        },
      ),
    );
  }
}
