import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/globalData/covid_cubit.dart';
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
                          height: AppDimensions.normalize(60),
                          width: AppDimensions.normalize(130),
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
                              Container(
                                padding: Space.all(),
                                height: AppDimensions.normalize(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '1000',
                                          style: AppText.b2!.cl(
                                            Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Confirmed',
                                          style: AppText.b2!.cl(
                                            Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Space.x1!,
                                    const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                    Space.x1!,
                                    Column(
                                      children: [
                                        Text(
                                          '1000',
                                          style: AppText.b2!.cl(
                                            Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Active',
                                          style: AppText.b2!.cl(
                                            Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    Space.x1!,
                                    const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                    Space.x1!,
                                    Column(
                                      children: [
                                        Text(
                                          '1000',
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
                              )
                            ],
                          ),
                        ),
                      ),
                      Space.y1!,
                      Positioned(
                        left: 70,
                        bottom: 120,
                        child: Image.asset(
                          'assets/doc-fight.png',
                          height: AppDimensions.normalize(40),
                        ),
                      ),
                    ],
                  ),
                ),

                // Center(
                //   child: SizedBox(
                //     height: AppDimensions.normalize(80),
                //     child: Image.asset('lib/assets/global.png'),
                //   ),
                // ),
                // Text(
                //   'Global Covid-19',
                //   style: AppText.h1,
                // ),
                // Space.y!,
                // BlocBuilder<CovidCubit, CovidState>(
                //   builder: (context, state) {
                //     if (state is CovidLoading) {
                //       return const LinearProgressIndicator();
                //     } else if (state is CovidFailure) {
                //       return Text(state.error!);
                //     } else if (state is CovidSuccess) {
                //       return Expanded(
                //         child: ListView(
                //           children: [
                //             DataCard(
                //               global: 'Global',
                //               totalCases: 'Total Cases',
                //               totalData: state.data!.cases!,
                //             ),
                //             Space.y1!,
                //             DataCard(
                //               global: 'Global',
                //               totalCases: 'Total Deaths',
                //               totalData: state.data!.deaths,
                //             ),
                //             Space.y1!,
                //             DataCard(
                //               global: 'Global',
                //               totalCases: 'Total Recovered',
                //               totalData: state.data!.recovered,
                //             ),
                //           ],
                //         ),
                //       );
                //     } else {
                //       return const Text('Something went Wrong');
                //     }
                //   },
                // ),
                // const CustomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
