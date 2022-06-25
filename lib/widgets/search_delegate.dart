import 'package:covid_tracker/configs/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/countriesData/countries_cubit.dart';
import 'countries_card.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where(
              ((element) => element['country']
                  .toString()
                  .toLowerCase()
                  .startsWith(query)),
            )
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: ((context, index) {
        return SingleChildScrollView(
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
        );
      }),
    );
  }
}
