import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/widgets/data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/app.dart';
import '../models/covid.dart';

class GlobalDataScreen extends StatefulWidget {
  const GlobalDataScreen({Key? key}) : super(key: key);

  @override
  State<GlobalDataScreen> createState() => _GlobalDataScreenState();
}

class _GlobalDataScreenState extends State<GlobalDataScreen> {
  @override
  void initState() {
    final covidCubit = BlocProvider.of<CovidCubit>(context);
    if (covidCubit.state.data == null || covidCubit.state.data!.isEmpty) {
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
                height: AppDimensions.normalize(120),
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
                  return ListView(
                    children: state.data!
                        .map((covid) => DataCard(
                              global: 'Global',
                              totalCases: 'Total Cases',
                              totalData: covid.totalCases,
                            ))
                        .toList(),
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
