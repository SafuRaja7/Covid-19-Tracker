import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/widgets/country_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocBuilder(
          builder: (context, state) {
            if (state is CountriesdataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountriesdataFailure) {
              return const Text("Something happened");
            } else if (state is CountriesdataSuccess) {
              return Column(
                children: [
                  Space.y2!,
                  Text(
                    'Total Cases',
                    style: AppText.h1b!,
                  ),
                  Space.y2!,
                  Text(
                    // country!.cases.toString(),
                    '',
                    style: AppText.h2b!,
                  ),
                  Space.y!,
                  Text(
                    // country!.country.toString(),
                    '',
                    style: AppText.h2b!,
                  ),
                  Space.y2!,
                  CountriesData(
                    data: country!.cases.toString(),
                    headerString: 'Total Deaths',
                  ),
                ],
              );
            } else {
              return const Text("Something went wrong");
            }
          },
        ),
      ),
    );
  }
}
