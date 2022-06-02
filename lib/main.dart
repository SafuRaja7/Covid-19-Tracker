import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/providers.dart';

import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/screens/dashboard.dart';
import 'package:covid_tracker/screens/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        },
      ),
    );
  }
}
