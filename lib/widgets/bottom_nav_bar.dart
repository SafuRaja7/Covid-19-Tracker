import 'package:covid_tracker/cubit/navBar/navbar_cubit.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocBuilder<NavBarCubit, NavbarState>(
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
    );
  }
}
