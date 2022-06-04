// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:covid_tracker/configs/configs.dart';

class DataCard extends StatelessWidget {
  final int? totalData;
  final String? global;
  final String? totalCases;
  final String? totalDeaths;
  final String? totalRecoveries;
  final String? image;

  const DataCard({
    Key? key,
    this.totalData,
    this.global,
    this.totalCases,
    this.totalDeaths,
    this.totalRecoveries,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###");
    return Container(
      height: AppDimensions.normalize(47),
      width: double.infinity,
      margin: Space.all(0.7, 0),
      padding: Space.all(0.5, 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.cyan,
            Colors.indigo,
          ],
          // begin: FractionalOffset(0.0, 0.0),
          // end: FractionalOffset(1.0, 0.0),
          // stops: [0.0, 1.0],
          // tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 10),
            blurRadius: 20,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.y!,
            Text(
              global!,
              style: AppText.h3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  totalCases!,
                  style: AppText.h2b,
                ),
                SizedBox(
                  height: AppDimensions.normalize(25),
                  width: AppDimensions.normalize(25),
                  child: const Image(
                    image: AssetImage('lib/assets/bacteria.png'),
                  ),
                ),
              ],
            ),
            Text(
              formatter.format(totalData),
              style: AppText.h2,
            ),
          ],
        ),
      ),
    );
  }
}
