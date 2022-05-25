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
        title: const Text('Data'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.y1!,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space.xf(5),
                  SizedBox(
                    width: AppDimensions.normalize(70),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'lib/assets/coronavirus.png',
                      height: AppDimensions.normalize(40),
                    ),
                  ),
                ],
              ),
            ),
            Space.y2!,
            CountriesData(
              data: country!.deaths,
              headerString: 'Total Deaths',
            ),
            Space.y!,
            CountriesData(
              data: country!.critical,
              headerString: 'Critical Cases',
            ),
            Space.y!,
            CountriesData(
              data: country!.todayDeaths,
              headerString: 'Today Deaths',
            ),
            Space.y!,
            CountriesData(
              data: country!.active,
              headerString: 'Active Cases',
            ),
            Space.y!,
            CountriesData(
              data: country!.active,
              headerString: 'Today Cases',
            ),
          ],
        ),
      )),
    );
  }
}
