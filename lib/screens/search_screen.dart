// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_tracker/configs/space.dart';
import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
import 'package:covid_tracker/widgets/countries_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:covid_tracker/widgets/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List countries = [];
  List searchedCountry = [];

  @override
  void initState() {
    super.initState();
    final countriesCubit = BlocProvider.of<CountriesdataCubit>(context);

    countries = List.from(countries)
      ..addAll(
        countriesCubit.state.data!.toList(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
        actions: [
          FormBuilder(
            child: CustomTextField(
              name: 'search',
              hint: 'Search',
              textInputType: TextInputType.text,
              onChangeFtn: (value) {
                if (value!.isEmpty) {
                  setState(() {
                    searchedCountry = [];
                  });
                }
                if (value.isNotEmpty) {
                  setState(
                    () {
                      searchedCountry.where((element) {
                        final countryName =
                            element.name.toLowerCase.contains(value);
                        return countryName;
                      }).toList();
                    },
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Wrap(
            children: searchedCountry
                .map(
                  (e) => Column(
                    children: [
                      CountriesCard(e),
                      const Divider(),
                      Space.y!,
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
