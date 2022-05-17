import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:flutter/material.dart';

import '../widgets/data_card.dart';

class GlobalDataScreen extends StatelessWidget {
  const GlobalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppDimensions.normalize(120),
                child: Image.asset('lib/assets/global.png'),
              ),
            ),
            const DataCard(
                global: 'Global', totalCases: 'Total Cases', totalData: 123),
          ],
        ),
      ),
    );
  }
}
