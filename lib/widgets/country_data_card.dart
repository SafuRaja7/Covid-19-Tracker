import 'package:flutter/material.dart';

import 'package:covid_tracker/configs/configs.dart';

class CountriesData extends StatelessWidget {
  final String? data;
  final String? headerString;

  const CountriesData({
    Key? key,
    this.data,
    this.headerString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppDimensions.normalize(50),
          width: double.infinity,
          margin: Space.all(0.5, 0),
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
              Space.y1!,
              Text(
                data.toString(),
                style: AppText.h1b,
              ),
              Space.y1!,
              Text(
                headerString!,
                style: AppText.h3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
