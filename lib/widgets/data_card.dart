import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String? global;
  final String? totalCases;
  final String? totalDaths;
  final String? totalRecoveries;
  final int? totalData;

  const DataCard(
      {super.key,
      this.global,
      this.totalCases,
      this.totalData,
      this.totalDaths,
      this.totalRecoveries});

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
            totalData.toString(),
            style: AppText.h2,
          ),
        ],
      ),
    );
  }
}
