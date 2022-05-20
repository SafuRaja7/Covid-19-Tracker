import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:flutter/material.dart';

class CountriesCard extends StatelessWidget {
  final Country country;
  const CountriesCard(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.normalize(30),
      width: double.infinity,
      margin: Space.all(0.5, 0.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 10),
            blurRadius: 12,
            spreadRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Space.y!,
          Text(country.country!),
          Space.y1!,
          Text(country.cases!.toString()),
        ],
      ),
    );
  }
}
