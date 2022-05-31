part of 'countries_cubit.dart';

class CountryRepo {
  final CountryDataProvider query = CountryDataProvider();
  Future<List<Country>> fetchCountry() =>
      CountryDataProvider.fetchCountry(query: query.toString());
}
