import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/widgets/country_data_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountriesDataScreen extends StatelessWidget {
  final Country? country;
  const CountriesDataScreen({this.country, super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###");
    App.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Data',
          style: AppText.h2!.cl(Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.y1!,
            Text(
              'Total Cases',
              style: AppText.h2,
            ),
            Text(
              formatter.format(country!.cases),
              style: AppText.h1b!,
            ),
            Space.y!,
            Text(
              country!.country.toString(),
              style: AppText.h1!,
            ),
            Space.y2!,
            CountriesData(
              data: country!.deaths,
              headerString: 'Total Deaths',
            ),
            Space.y!,
            CountriesData(
              data: country!.active,
              headerString: 'Active Cases',
            ),
            Space.y!,
            CountriesData(
              data: country!.recovered,
              headerString: 'Recovered',
            ),
            Space.y!,
          ],
        ),
      )),
    );
  }
}
