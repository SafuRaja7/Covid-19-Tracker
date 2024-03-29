import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountriesCard extends StatelessWidget {
  final Country country;
  const CountriesCard(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###");
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
        width: double.infinity,
        margin: Space.all(0.5, 0.1),
        padding: Space.all(0.7, 0),
        decoration: BoxDecoration(
          color: AppTheme.c!.background,
          borderRadius: BorderRadius.circular(
            AppDimensions.normalize(1.5),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.y!,
            Text(
              country.country!,
              style: AppText.h2!,
            ),
            Space.y!,
            Text(
              '${formatter.format(country.cases)} Cases',
              style: AppText.h3!,
            ),
            Space.y!,
          ],
        ),
      ),
    );
  }
}
