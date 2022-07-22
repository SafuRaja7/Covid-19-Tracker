// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/models/pakistan.dart';

class PakistanDataCard extends StatelessWidget {
  final int? data;
  final String? headerString;
  final Pakistan? pakistan;

  const PakistanDataCard({
    Key? key,
    this.data,
    this.headerString,
    this.pakistan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###");
    return Column(
      children: [
        Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'lib/assets/virus.png',
                  height: AppDimensions.normalize(25),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Flag extends StatelessWidget {
  const Flag({super.key});

  String emoji() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "PK";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          emoji(),
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1),
        ),
        Text(
          "PAKISTAN",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
      ],
    );
  }
}
