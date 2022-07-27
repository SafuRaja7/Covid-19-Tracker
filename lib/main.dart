import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/cubit/pakistan/pakistan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/models/global.dart';
import 'package:covid_tracker/providers/nav_bar_provider.dart';
import 'package:covid_tracker/providers/theme_provider.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/screens/dashboard.dart';
import 'package:covid_tracker/screens/splash.dart';
import 'configs/core_theme.dart' as theme;

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
          BlocProvider(create: (context) => CovidCubit()),
          BlocProvider(create: (context) => CountriesdataCubit()),
          BlocProvider(create: (context) => PakistanCubit()),
          ChangeNotifierProvider(
              create: (context) => BottomNavigationBarProvider()),
          ChangeNotifierProvider(create: ((context) => ThemeProvider())),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialChild(
              provider: themeProvider,
            );
          },
        ));
  }
}

class MaterialChild extends StatelessWidget {
  final ThemeProvider provider;
  const MaterialChild({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init;
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: theme.themeDark,
      theme: theme.themeLight,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/global_data': (context) => const GlobalDataScreen(),
        '/countries_screen': (context) => const CountriesScreen(),
        '/countries_data_screen': (context) => const CountriesDataScreen(),
        // '/nav_bar': (context) => const BottomNavBar(),
      },
    );
  }
}
