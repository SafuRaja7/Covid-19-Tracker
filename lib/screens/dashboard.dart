import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
import 'package:covid_tracker/screens/countries_screen.dart';
import 'package:covid_tracker/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                SizedBox(
                  height: AppDimensions.normalize(165),
                  child: Stack(
                    children: [
                      Container(
                        height: AppDimensions.normalize(130),
                        color: Colors.deepPurple[200],
                        padding: Space.all(1.2, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: AppDimensions.normalize(8),
                                  child: const Text('Hix'),
                                ),
                                CircleAvatar(
                                  radius: AppDimensions.normalize(8),
                                  child: const Text('Hix'),
                                )
                              ],
                            ),
                            Space.y2!,
                            Text(
                              'Together Against Covid-19',
                              style: AppText.b2,
                            ),
                            Space.y1!,
                            Text(
                              'Stay Home',
                              style: AppText.h1b!.cl(Colors.deepPurple),
                            ),
                            Space.y!,
                            Text(
                              'Stay Safe',
                              style: AppText.h1b!.cl(
                                Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Space.y1!,
                      Positioned(
                        bottom: 0,
                        left: 30,
                        child: Container(
                          padding: Space.all(1),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Global',
                                style: AppText.h1b!.cl(
                                  Colors.white,
                                ),
                              ),
                              Text(
                                'Last Updated 2 hours ago',
                                style: AppText.b2!.cl(
                                  Colors.white,
                                ),
                              ),
                              Space.y1!,
                              BlocBuilder<CovidCubit, CovidState>(
                                builder: (context, state) {
                                  if (state is CovidLoading) {
                                    return const LinearProgressIndicator();
                                  } else if (state is CovidFailure) {
                                    return Text(state.error!);
                                  } else if (state is CovidSuccess) {
                                    return Container(
                                      padding: Space.all(),
                                      height: AppDimensions.normalize(30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Space.y!,
                                              Text(
                                                state.data!.deaths!.toString(),
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Deaths',
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Space.x!,
                                          const VerticalDivider(
                                            thickness: 2,
                                            indent: 10,
                                            endIndent: 10,
                                            color: Colors.black,
                                          ),
                                          Space.x!,
                                          Column(
                                            children: [
                                              Space.y!,
                                              Text(
                                                state.data!.cases!.toString(),
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Cases',
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          Space.x!,
                                          const VerticalDivider(
                                            thickness: 2,
                                            color: Colors.black,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          Space.x!,
                                          Column(
                                            children: [
                                              Space.y!,
                                              Text(
                                                state.data!.recovered!
                                                    .toString(),
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'Recovered',
                                                style: AppText.b2!.cl(
                                                  Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const Text('Something went Wrong');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                AppIconButton(
                  text: 'Continents',
                  onPressed: () {},
                  backgroundColor: Colors.deepPurple,
                ),
                Space.y2!,
                AppIconButton(
                  text: 'Countries',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CountriesScreen();
                        },
                      ),
                    );
                  },
                  backgroundColor: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
