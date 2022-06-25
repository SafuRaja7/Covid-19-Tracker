import 'package:covid_tracker/providers/nav_bar_provider.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/screens/pakistan_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/dashboard.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentTab = const [
    GlobalDataScreen(),
    CountriesScreen(),
    PakistanData(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Global',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'My Country',
          ),
        ],
      ),
    );
  }
}
