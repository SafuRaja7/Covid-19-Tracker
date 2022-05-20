import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/widgets/countries_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    final countriesCubit = BlocProvider.of<CountriesdataCubit>(context);
    if (countriesCubit.state.data == null) {
      countriesCubit.fetchCountry();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CountriesdataCubit, CountriesdataState>(
            builder: (context, state) {
              if (state is CountriesdataLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CountriesdataFailure) {
                return Text(state.error!);
              } else if (state is CountriesdataSuccess) {
                return SizedBox(
                  height: AppDimensions.normalize(290),
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
        ),
      ),
    );
  }
}