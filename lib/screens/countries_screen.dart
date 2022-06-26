import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/widgets/countries_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_text_fiels.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final countriesCubit = BlocProvider.of<CountriesdataCubit>(context);
    if (countriesCubit.state.data == null ||
        countriesCubit.state.data!.isEmpty) {
      countriesCubit.fetchCountry();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countryCubit = BlocProvider.of<CountriesdataCubit>(context);
    App.init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Countries"),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         showSearch(
          //             context: context,
          //             delegate: Search(countriesCubit as List));
          //       },
          //       icon: const Icon(Icons.search))
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.normalize(5),
              ),
              
              BlocBuilder<CountriesdataCubit, CountriesdataState>(
                builder: (context, state) {
                  if (state is CountriesdataLoading) {
                    return const LinearProgressIndicator();
                  } else if (state is CountriesdataFailure) {
                    return Text(state.error!);
                  } else if (state is CountriesdataSuccess) {
                    return SizedBox(
                      height: AppDimensions.normalize(292),
                      child: ListView(
                        children: state.data!
                            .map(
                              (country) => CountriesCard(country),
                            )
                            .toList(),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Something went wrong!!"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
