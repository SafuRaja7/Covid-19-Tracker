// import 'package:covid_tracker/configs/app_dimensions.dart';
// import 'package:covid_tracker/cubit/countriesData/countries_cubit.dart';
// import 'package:covid_tracker/widgets/countries_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchCountry extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.close),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: AppDimensions.normalize(5),
//           ),
//           BlocBuilder<CountriesdataCubit, CountriesdataState>(
//             builder: (context, state) {
//               if (state is CountriesdataLoading) {
//                 return const LinearProgressIndicator();
//               } else if (state is CountriesdataFailure) {
//                 return Text(state.error!);
//               } else if (state is CountriesdataSuccess) {
//                 return SizedBox(
//                   height: AppDimensions.normalize(292),
//                   child: ListView(
//                     children: state.data!
//                         .map(
//                           (country) => CountriesCard(country),
//                         )
//                         .toList(),
//                   ),
//                 );
//               } else {
//                 return const Center(
//                   child: Text("Something went wrong!!"),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text("Search Country"),
//     );
//   }
// }
