import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/widgets/country_data_card.dart';
import 'package:flutter/material.dart';

class CountriesDataScreen extends StatelessWidget {
  final Country? country;
  const CountriesDataScreen({this.country, super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Space.y2!,
            Text(
              'Total Cases',
              style: AppText.h1b!,
            ),
            Space.y2!,
            Text(
              country!.cases.toString(),
              style: AppText.h2b!,
            ),
            Space.y!,
            Text(
              country!.country.toString(),
              style: AppText.h2b!,
            ),
            Space.y2!,
            CountriesData(
              data: country!.deaths.toString(),
              headerString: 'Total Deaths',
            ),
            Space.y!,
            CountriesData(
              data: country!.critical.toString(),
              headerString: 'Critical Cases',
            ),
            Space.y!,
            CountriesData(
              data: country!.todayDeaths.toString(),
              headerString: 'Today Deaths',
            ),
            Space.y!,
            CountriesData(
              data: country!.active.toString(),
              headerString: 'Active Cases',
            ),
            Space.y!,
            CountriesData(
              data: country!.active.toString(),
              headerString: 'Today Cases',
            ),
          ],
        ),
      )),
    );
  }
}
