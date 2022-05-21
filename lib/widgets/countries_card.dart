import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:flutter/material.dart';

class CountriesCard extends StatelessWidget {
  final Country country;
  const CountriesCard(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => CountriesDataScreen(
                  country: country,
                )),
          ),
        );
      },
      child: Container(
        height: AppDimensions.normalize(25),
        width: double.infinity,
        margin: Space.all(0.5, 0.1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AppDimensions.normalize(1.5),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 30),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(country.country!),
            Text(country.cases!.toString()),
          ],
        ),
      ),
    );
  }
}
