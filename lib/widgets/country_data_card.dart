import 'package:flutter/material.dart';

import 'package:covid_tracker/configs/configs.dart';
import 'package:intl/intl.dart';

class CountriesData extends StatelessWidget {
  final int? data;
  final String? headerString;

  const CountriesData({
    Key? key,
    this.data,
    this.headerString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###");
    return Container(
      height: AppDimensions.normalize(35),
      width: double.infinity,
      margin: Space.all(0.5, 0),
      padding: Space.all(0.7, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.cyan, Colors.indigo],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.y!,
          Text(
            formatter.format(data),
            style: AppText.h1b,
          ),
          Space.y1!,
          Text(
            headerString!,
            style: AppText.h3!,
          ),
        ],
      ),
    );
  }
}
