import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/widgets/global_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/app.dart';
import '../widgets/custom_navbar.dart';

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

  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Exit Application",
            ),
            content: const Text(
              "Are You Sure?",
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: AppDimensions.normalize(80),
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
                const CustomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
