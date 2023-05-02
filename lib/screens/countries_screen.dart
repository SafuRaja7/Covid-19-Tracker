import 'package:covid_tracker/configs/app.dart';
import 'package:covid_tracker/configs/configs.dart';
import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/screens/search_screen.dart';
import 'package:covid_tracker/widgets/countries_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    App.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Countries",
            style: AppText.h2!.cl(Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                );
              },
              child: Padding(
                padding: Space.h!,
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CountriesdataCubit, CountriesdataState>(
          builder: (context, state) {
            if (state is CountriesdataLoading) {
              return const LinearProgressIndicator();
            } else if (state is CountriesdataFailure) {
              return Text(state.error!);
            } else if (state is CountriesdataSuccess) {
              return ListView(
                shrinkWrap: true,
                children: state.data!
                    .map(
                      (country) => CountriesCard(country),
                    )
                    .toList(),
              );
            } else {
              return const Center(
                child: Text("Something went wrong!!"),
              );
            }
          },
        ),
      ),
    );
  }
}
