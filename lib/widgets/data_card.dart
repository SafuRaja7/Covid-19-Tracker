import 'package:covid_tracker/configs/configs.dart';
import 'package:flutter/material.dart';

import '../models/covid.dart';

class DataCard extends StatelessWidget {
  final String? covidCasulalities;
  final String? global;
  final String? totalCases;
  final String? totalDeaths;
  final String? totalRecoveries;

  const DataCard({
    super.key,
    this.global,
    this.totalCases,
    this.totalDeaths,
    this.totalRecoveries,
    this.covidCasulalities,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.normalize(50),
      width: double.infinity,
      margin: Space.all(0.7, 0),
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
          Text(
            global!,
            style: AppText.h2b,
          ),
          Space.y!,
          Text(
            totalCases!,
            style: AppText.h2b,
          ),
          Space.y2!,
          Text(
            covidCasulalities!.toString(),
            style: AppText.h2,
          ),
        ],
      ),
    );
  }
}
