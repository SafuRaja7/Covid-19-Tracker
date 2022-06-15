import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
<<<<<<< HEAD
=======
import 'package:covid_tracker/providers.dart';
import 'package:covid_tracker/screens/countries_data_screen.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
>>>>>>> dd752f8d650f86756df97890b0c62f95aeecd737
import 'package:covid_tracker/widgets/global_data_card.dart';
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
                height: AppDimensions.normalize(90),
                child: Image.asset('lib/assets/global.png'),
              ),
            ),
            Text(
              'Global Covid-19',
              style: AppText.h1,
            ),
            Space.y!,
            BlocBuilder<CovidCubit, CovidState>(
              builder: (context, state) {
                if (state is CovidLoading) {
                  return const LinearProgressIndicator();
                } else if (state is CovidFailure) {
                  return Text(state.error!);
                } else if (state is CovidSuccess) {
                  return Expanded(
                    child: ListView(
                      children: [
                        DataCard(
                          global: 'Global',
                          totalCases: 'Total Cases',
                          totalData: state.data!.cases!,
                        ),
                        Space.y1!,
                        DataCard(
                          global: 'Global',
                          totalCases: 'Total Deaths',
                          totalData: state.data!.deaths,
                        ),
                        Space.y1!,
                        DataCard(
                          global: 'Global',
                          totalCases: 'Total Recovered',
                          totalData: state.data!.recovered,
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text('Something went Wrong');
                }
              },
            ),
<<<<<<< HEAD
=======
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/countries_screen');
                },
                child: const Text('Countries'),
              ),
            ),
>>>>>>> dd752f8d650f86756df97890b0c62f95aeecd737
          ],
        ),
      ),
    );
  }
}
