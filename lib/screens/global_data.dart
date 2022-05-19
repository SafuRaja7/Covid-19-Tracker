import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/app.dart';

class GlobalDataScreen extends StatefulWidget {
  const GlobalDataScreen({Key? key}) : super(key: key);

  @override
  State<GlobalDataScreen> createState() => _GlobalDataScreenState();
}

class _GlobalDataScreenState extends State<GlobalDataScreen> {
  @override
  void initState() {
    final covidCubit = BlocProvider.of<CovidCubit>(context);
    if (covidCubit.state.data == null) {
      covidCubit.fetchData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppDimensions.normalize(110),
                child: Image.asset('lib/assets/global.png'),
              ),
            ),
            BlocBuilder<CovidCubit, CovidState>(
              builder: (context, state) {
                if (state is CovidLoading) {
                  return const LinearProgressIndicator();
                } else if (state is CovidFailure) {
                  return Text(state.error!);
                } else if (state is CovidSuccess) {
                  return Column(
                    children: [
                      DataCard(
                        global: 'Global',
                        totalCases: 'Total Cases',
                        covid: state.data,
                      ),
                      Space.y1!,
                      const DataCard(
                        global: 'Global',
                        totalCases: 'Total Deaths',
                      ),
                      Space.y1!,
                      const DataCard(
                        global: 'Global',
                        totalCases: 'Total Recovered',
                      )
                    ],
                  );
                } else {
                  return const Text('Something went Wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
