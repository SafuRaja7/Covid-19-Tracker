part of 'countries_cubit.dart';

class CountryRepo {
  Future<List<Country>> fetchCountry( ) =>
      CountryDataProvider.fetchCountry();
}
