import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/cubit/navBar/navbar_cubit.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/widgets/bottom_nav_bar.dart';
import 'package:covid_tracker/widgets/global_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/app.dart';

class GlobalDataScreen extends StatefulWidget {
  const GlobalDataScreen({Key? key}) : super(key: key);

  @override
  State<GlobalDataScreen> createState() => _GlobalDataScreenState();
}

class _GlobalDataScreenState extends State<GlobalDataScreen> {
  @override
  void initState() {
    final covidCubit = BlocProvider.of<CovidCubit>(context);
    if (covidCubit.state.data == null) {
      covidCubit.fetchData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<NavBarCubit, NavbarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Global'),
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Global'),
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Global'),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavBarItem.global);
                } else if (index == 1) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavBarItem.countries);
                } else if (index == 2) {
                  BlocProvider.of<NavBarCubit>(context)
                      .getNavBarItem(NavBarItem.pakistan);
                }
              },
            );
          },
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppDimensions.normalize(110),
                child: Image.asset('lib/assets/global.png'),
              ),
            ),
            BlocBuilder<CovidCubit, CovidState>(
              builder: (context, state) {
                if (state is CovidLoading) {
                  return const LinearProgressIndicator();
                } else if (state is CovidFailure) {
                  return Text(state.error!);
                } else if (state is CovidSuccess) {
                  return Column(
                    children: [
                      DataCard(
                        global: 'Global',
                        totalCases: 'Total Cases',
                        totalData: state.data!.cases!.toString(),
                      ),
                      Space.y1!,
                      DataCard(
                        global: 'Global',
                        totalCases: 'Total Deaths',
                        totalData: state.data!.deaths.toString(),
                      ),
                      Space.y1!,
                      DataCard(
                        global: 'Global',
                        totalCases: 'Total Recovered',
                        totalData: state.data!.recovered.toString(),
                      )
                    ],
                  );
                } else {
                  return const Text('Something went Wrong');
                }
              },
            ),
            BlocBuilder<NavBarCubit, NavbarState>(
              builder: (context, state) {
                if (state.navbarItem == NavBarItem.global) {
                  return const GlobalDataScreen();
                } else if (state.navbarItem == NavBarItem.countries) {
                  return const CountriesScreen();
                } else if (state.navbarItem == NavBarItem.pakistan) {
                  return const CountriesDataScreen();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
